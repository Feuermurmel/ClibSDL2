# ClibSDL2

Swift package containing binaries of SDL and SDL_image for macOS.

May not work.

Branch `main` contains subtrees with the patched sources for SDL and 
SDL_image. Branch `release` contains built .xcframework bundles, which are 
referenced by `Package.swift` together with the sources from which they were 
built. Releases are tagged on the `release` branch.


## Building & Releasing

```
version=<version>
git checkout release
git merge main
./build-sdl.sh && ./build-sdl-image.sh && ./build-frameworks.sh
git add -A Frameworks
git commit -m "Release $version"
git tag "$version"
git push origin release "$version"
```
