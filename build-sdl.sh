#! /usr/bin/env bash

set -eu

root_dir="$(readlink -f "$(dirname "$BASH_SOURCE")")"

source_dir="$root_dir/Libraries/SDL"
prefix_dir="$root_dir/prefix"

# Some files tracked by Git are overwritten by the build system. The modified
# versions are backed up and moved in place during the build.
modified_files=("include/SDL_config.h" "include/SDL_revision.h")

(
    cd "$source_dir"

    if ! [[ -e 'config.status' ]]; then
        ./configure --disable-static --prefix="$prefix_dir"

        for i in "${modified_files[@]}"; do cp -p "$i"{,~modified}; done
    fi

    for i in "${modified_files[@]}"; do cp -p "$i"{~modified,}; done

    make -j 4
    make install

    git checkout "${modified_files[@]}"
)

echo "$0: Done."
