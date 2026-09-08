export FC=gfortran
TREXIO_DIR=/home/scemama/TREX/trexio/_install/

rm -rf build_foo
cmake -B build_foo \
  -DCMAKE_Fortran_FLAGS="-I$TREXIO_DIR/include" \
  -DCMAKE_LIBRARY_PATH="$TREXIO_DIR/lib" \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,$TREXIO_DIR/lib" \
  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-rpath,$TREXIO_DIR/lib" 

cmake --build build_foo
