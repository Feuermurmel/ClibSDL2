#! /usr/bin/env bash

set -eu

root_dir="$(readlink -f "$(dirname "$BASH_SOURCE")")"

prefix_dir="$root_dir/prefix"
frameworks_dir="$root_dir/Frameworks"

rm -rf "$frameworks_dir"

xcodebuild \
    -create-xcframework \
    -library "$prefix_dir/lib/libSDL2-2.0.0.dylib" \
    -headers "$prefix_dir/include" \
    -output "$frameworks_dir/libSDL2.xcframework"

xcodebuild \
    -create-xcframework \
    -library "$prefix_dir/lib/libSDL2_image-2.0.0.dylib" \
    -headers "$prefix_dir/include" \
    -output "$frameworks_dir/libSDL2_image.xcframework"
