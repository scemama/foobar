cmake_minimum_required(VERSION 3.24...4.2)
project(foo LANGUAGES Fortran)

# Get trexio dependency
find_package(PkgConfig REQUIRED)
pkg_check_modules(trexio REQUIRED IMPORTED_TARGET trexio)

# Define the main project files
add_library(foo
    trexio_module.F90
    foo_module.F90
)
target_link_libraries(foo PRIVATE PkgConfig::trexio)
target_include_directories(foo PUBLIC "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>")

# Install the project and its mod files
# This is independent of trexio's view of .mod file installation, if foo wants to be consumed as .mod it is their choice
install(TARGETS foo
    EXPORT fooTargets
)
install(FILES
    ${CMAKE_Fortran_MODULE_DIRECTORY}/foo_module.mod
    # Feel free to comment this one if you think it inteferes
    ${CMAKE_Fortran_MODULE_DIRECTORY}/trexio_module.mod
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# Other CMake auxiliaries to make the project consumable as a CMake project
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/fooConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)
configure_package_config_file(
    fooConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/fooConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/fooConfigVersion.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/fooConfig.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo
)
install(EXPORT fooTargets
    FILE fooTargets.cmake
    NAMESPACE foo::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo
)
