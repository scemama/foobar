#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "foo::foo" for configuration ""
set_property(TARGET foo::foo APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(foo::foo PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "Fortran"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libfoo.a"
  )

list(APPEND _cmake_import_check_targets foo::foo )
list(APPEND _cmake_import_check_files_for_foo::foo "${_IMPORT_PREFIX}/lib/libfoo.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
