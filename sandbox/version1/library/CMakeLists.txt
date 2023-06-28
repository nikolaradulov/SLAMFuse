cmake_minimum_required(VERSION 3.12)
project(asciidraw VERSION 1.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Add your source files
set(SOURCES src/asciidraw.cpp)

# Create the library
add_library(asciidraw ${SOURCES})

# Specify the library version
set_target_properties(asciidraw PROPERTIES VERSION ${PROJECT_VERSION})

# Specify the library installation path
include(GNUInstallDirs)
install(TARGETS asciidraw
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
install(FILES src/asciidraw.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
