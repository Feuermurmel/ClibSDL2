sdl_build_path := build/SDL2
sdl_dylib_path := prefix/lib/libSDL2-2.0.0.dylib
sdl_framework_path := Frameworks/libSDL2.xcframework

sdl_image_build_path := build/SDL2_image
sdl_image_dylib_path := prefix/lib/libSDL2_image-2.0.0.dylib
sdl_image_framework_path := Frameworks/libSDL2_image.xcframework

.PHONY: all
all: $(sdl_framework_path)/Info.plist $(sdl_image_framework_path)/Info.plist

.PHONY: clean
clean:
	rm -rf build prefix Frameworks

$(sdl_build_path)/config.status:
	mkdir -p $(sdl_build_path)
	cd $(sdl_build_path) && $(abspath SDL2/configure) \
        CC="clang" \
        CFLAGS="-arch x86_64 -arch arm64" \
        LDFLAGS="-arch x86_64 -arch arm64" \
        --disable-static \
        --prefix="$(abspath prefix)"

$(sdl_dylib_path): $(sdl_build_path)/config.status
	$(MAKE) -C $(sdl_build_path) install

# libSDL2.xcframework contains all the headers for SDL2 and SDL2_image while
# libSDL2_image.xcframework does not contain any headers. This is because
# they're installed in the same prefix and having the same header files in
# multiple XCFrameworks leads to build errors in XCode. Thus we exclude
# headers from libSDL2_image.xcframework. To make sure that all headers are
# included in libSDL2.xcframework, this target also depends on SDL2_image
# being installed in the prefix in addition to SDL2.
$(sdl_framework_path)/Info.plist: $(sdl_dylib_path) $(sdl_image_dylib_path)
	rm -rf "$(sdl_framework_path)"
	xcodebuild \
        -create-xcframework \
        -library "$(sdl_dylib_path)" \
        -headers "prefix/include" \
        -output "$(sdl_framework_path)"

$(sdl_image_build_path)/config.status: $(sdl_dylib_path)
	mkdir -p $(sdl_image_build_path)
	cd $(sdl_image_build_path) && $(abspath SDL2_image/configure) \
        CC="clang" \
        CFLAGS="-arch x86_64 -arch arm64" \
        LDFLAGS="-arch x86_64 -arch arm64" \
        --disable-webp \
        --disable-static \
        --prefix="$(abspath prefix)"

$(sdl_image_dylib_path): $(sdl_image_build_path)/config.status
	$(MAKE) -C $(sdl_image_build_path) install

$(sdl_image_framework_path)/Info.plist: $(sdl_image_dylib_path)
	rm -rf "$(sdl_image_framework_path)"
	xcodebuild \
        -create-xcframework \
        -library "$(sdl_image_dylib_path)" \
        -output "$(sdl_image_framework_path)"
