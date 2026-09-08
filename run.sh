#!/bin/bash
set -x

# Make sure trexio is installed somewhere where pkg-config can find it

cmake -B build_foo -S foo -DCMAKE_INSTALL_PREFIX=$(pwd)/install_foo
cmake --build build_foo
cmake --install build_foo
cmake -B build_bar -S bar -Dfoo_ROOT=$(pwd)/install_foo
cmake --build build_bar
rm -f foo.hdf5
./build_bar/bar_exe
