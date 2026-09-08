set -euo pipefail

export FC="${FC:-gfortran}"
TREXIO_DIR="${TREXIO_DIR:-${PREFIX:-$HOME/.cache/trexio/2.6.1}}"
TREXIO_INCLUDE_DIR="$TREXIO_DIR/include"
TREXIO_LIB_DIR="$TREXIO_DIR/lib"

if [ ! -d "$TREXIO_LIB_DIR" ] && [ -d "$TREXIO_DIR/lib64" ]; then
  TREXIO_LIB_DIR="$TREXIO_DIR/lib64"
fi

rm -rf build_bar
cmake -B build_bar \
  -DFETCHCONTENT_SOURCE_DIR_FOO=../ \
  -DCMAKE_Fortran_FLAGS="-I$TREXIO_INCLUDE_DIR" \
  -DCMAKE_LIBRARY_PATH="$TREXIO_LIB_DIR" \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath,$TREXIO_LIB_DIR" \
  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-rpath,$TREXIO_LIB_DIR"

cmake --build build_bar
