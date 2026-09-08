cmake_minimum_required(VERSION 3.24...4.2)
project(bar LANGUAGES Fortran)

# Get dependencies
find_package(PkgConfig REQUIRED)
pkg_check_modules(trexio REQUIRED IMPORTED_TARGET trexio)
find_package(foo REQUIRED)

# Define the main project files
add_library(bar
    bar_module.F90
    # This part is contentious. If bar does not also build `trexio_module.F90`, where should it know it was built before?
    trexio_module.F90
)
target_link_libraries(foo PRIVATE PkgConfig::trexio foo::foo)
