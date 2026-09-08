#!/bin/bash
set -x
set -e

# Make sure trexio is installed somewhere where pkg-config can find it

cmake -B build_foo -S foo -DCMAKE_INSTALL_PREFIX=$(pwd)/install_foo
cmake --build build_foo
cmake --install build_foo

cmake -B build_foo2 -S foo2 -DCMAKE_INSTALL_PREFIX=$(pwd)/install_foo2
cmake --build build_foo2
cmake --install build_foo2

cmake -B build_bar -S bar -Dfoo_ROOT=$(pwd)/install_foo -Dfoo2_ROOT=$(pwd)/install_foo2
cmake --build build_bar

rm -f foo.hdf5 foo2.hdf5
./build_bar/bar_exe

cmake -B build_bar_trexio -S bar -Dfoo_ROOT=$(pwd)/install_foo -Dfoo2_ROOT=$(pwd)/install_foo2
cmake --build build_bar_trexio

rm -f foo.hdf5 foo2.hdf5
./build_bar_trexio/bar_trexio_exe
