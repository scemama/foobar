cmake_minimum_required(VERSION 3.24...4.2)
project(foo2 VERSION 0.1.0 LANGUAGES Fortran)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

# Get trexio dependency
find_package(PkgConfig REQUIRED)
pkg_check_modules(trexio REQUIRED IMPORTED_TARGET trexio)

# Define the main project files
add_library(foo2
    trexio_module.F90
    foo2_module.F90
)
set_target_properties(foo2 PROPERTIES Fortran_MODULE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/mod")
target_link_libraries(foo2 PRIVATE PkgConfig::trexio)
target_include_directories(foo2 PUBLIC "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>")

# Install the project and its mod files
# This is independent of trexio's view of .mod file installation, if foo2 wants to be consumed as .mod it is their choice
install(TARGETS foo2
    EXPORT foo2Targets
)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/mod/foo2_module.mod
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

# Other CMake auxiliaries to make the project consumable as a CMake project
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/foo2ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)
configure_package_config_file(
    foo2Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/foo2Config.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo2
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/foo2ConfigVersion.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/foo2Config.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo2
)
install(EXPORT foo2Targets
    FILE foo2Targets.cmake
    NAMESPACE foo2::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/foo2
)
