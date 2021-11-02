#! /usr/bin/env bash

set -eu

root_dir="$(readlink -f "$(dirname "$BASH_SOURCE")")"

source_dir="$root_dir/Libraries/SDL_image"
prefix_dir="$root_dir/prefix"

(
    cd "$source_dir"

    if ! [[ -e 'config.status' ]]; then
        # We have to touch this file, otherwise the Makefile will try to run
        # automake, which fails in my case.
        touch Makefile.in

        # Path to SDL2.
        export CFLAGS="-I$prefix_dir/include/SDL2"
        export LDFLAGS="-L$prefix_dir/lib"

        ./configure --disable-static --prefix="$prefix_dir"
    fi

    make -j 4
    make install
)

echo "$0: Done."
