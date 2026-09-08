cmake_minimum_required(VERSION 3.14)
project(bar LANGUAGES Fortran)

include(FetchContent)

FetchContent_Declare(
  foo
  GIT_REPOSITORY https://github.com/scemama/foobar.git
  GIT_TAG main
  SOURCE_SUBDIR foo
)
FetchContent_MakeAvailable(foo)

add_executable(bar bar_module.F90 main_bar.F90)
set_target_properties(bar PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/modules
)
target_link_libraries(bar PRIVATE foo_module)
