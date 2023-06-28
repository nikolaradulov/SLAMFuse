# Install script for directory: /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen/src/MatrixFunctions" TYPE FILE FILES
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixExponential.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixFunction.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixFunctionAtomic.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixLogarithm.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixPower.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/MatrixSquareRoot.h"
    "/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src/MatrixFunctions/StemFunction.h"
    )
endif()

