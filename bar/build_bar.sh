export FC=gfortran
TREXIO_DIR=/home/scemama/TREX/trexio/_install/

rm -rf build_bar
cmake -B build_bar \
  -DFETCHCONTENT_SOURCE_DIR_FOO=../ \
  -DCMAKE_Fortran_FLAGS="-I$TREXIO_DIR/include" \
  -DCMAKE_LIBRARY_PATH="$TREXIO_DIR/lib" \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,$TREXIO_DIR/lib" \
  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-rpath,$TREXIO_DIR/lib" 

cmake --build build_bar
