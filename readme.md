# ClibSDL2

Swift package containing binaries of SDL and SDL_image for macOS.

May not work.

Includes vendored sources of [SDL](https://github.com/libsdl-org/SDL) and 
[SDL_image](https://github.com/libsdl-org/SDL_image). The release tags contain 
built XCFrameworks, which are referenced by `Package.swift` together with the
sources from which they were built.


## Included Libraries

See `download-sdl.sh` and `download-sdl-image.sh` for the exact versions 
included in a release.


## Building

Building the XCFrameworks from source should be as easy as running `make`.


## Updating Vendored Sources

Vendored sources must be updated on the `vendored` branch, which only contains 
the vendored sources and the scripts to download the sources. This allows 
patches to be applied on the `main` branch and merging them with newer 
versions of the vendored sources.

The `vendored` branch contains shell scripts to download the sources releases. 
The main purpose of these scripts is to document which releases of sources 
exactly has been included in this repository.

To update vendored sources, switch to the `vendored` branch, edit the 
appropriate `download-*.sh` files with the URLs of the new releases, run the 
scripts to download the releases, extract the archive files and replace the 
existing source directories with the newly downloaded ones. Then, create a 
commit with the new sources including the updated download scripts on the 
`vendored` branch and merge it into `main`.


## Releasing

To make a new release, use the `release.py` script. The script will create a 
clean build of the XCFrameworks, create a commit and tag with the specified 
version number and push the commit to `origin`. The commit is created in a 
detached HEAD state instead of on the current branch.
