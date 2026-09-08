cmake_minimum_required(VERSION 3.24...4.2)
project(bar LANGUAGES Fortran)

# Get dependencies
find_package(PkgConfig REQUIRED)
pkg_check_modules(trexio REQUIRED IMPORTED_TARGET trexio)
find_package(foo REQUIRED)
find_package(foo2 REQUIRED)

# Define the main project files
add_library(bar
    bar_module.F90
)
target_link_libraries(bar PRIVATE PkgConfig::trexio foo::foo foo2::foo2)

add_executable(bar_exe main_bar.F90)
target_link_libraries(bar_exe PRIVATE bar)

add_library(bar_trexio
    bar_module.F90
    trexio_module.F90
)
target_link_libraries(bar_trexio PRIVATE PkgConfig::trexio foo::foo foo2::foo2)

add_executable(bar_trexio_exe main_trexio_bar.F90)
target_link_libraries(bar_trexio_exe PRIVATE bar_trexio)


