cmake_minimum_required(VERSION 3.14)
project(foo LANGUAGES Fortran)

find_library(TREXIO_LIBRARY NAMES trexio)
if(NOT TREXIO_LIBRARY)
  message(FATAL_ERROR "trexio library not found. Please install trexio.")
endif()

add_library(trexio_module trexio_module.F90)
set_target_properties(trexio_module PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/modules
)
target_include_directories(trexio_module PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/modules)
target_link_libraries(trexio_module PUBLIC ${TREXIO_LIBRARY})

add_library(foo_module foo_module.F90)
set_target_properties(foo_module PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/modules
)
target_link_libraries(foo_module PUBLIC trexio_module)

add_executable(foo main_foo.F90)
target_link_libraries(foo PRIVATE foo_module)
