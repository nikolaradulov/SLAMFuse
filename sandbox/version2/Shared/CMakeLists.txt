cmake_minimum_required(VERSION 3.12)
project(mylibrary VERSION 1.0)

# Add your source files
set(SOURCES src/Sharedv2.cpp)

# Create the shared library
add_library(mylibrary SHARED ${SOURCES})

# Specify the library version
set_target_properties(mylibrary PROPERTIES VERSION ${PROJECT_VERSION})

# Specify the library installation path
include(GNUInstallDirs)
install(TARGETS mylibrary
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
