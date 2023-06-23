# Install script for directory: /home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen/src/Geometry" TYPE FILE FILES
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/AlignedBox.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/AngleAxis.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/EulerAngles.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Homogeneous.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Hyperplane.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/OrthoMethods.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/ParametrizedLine.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Quaternion.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Rotation2D.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/RotationBase.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Scaling.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Transform.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Translation.h"
    "/home/nrad/slambench/sandbox/eigen-3.2.10/Eigen/src/Geometry/Umeyama.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/nrad/slambench/sandbox/eigen-3.2.10/build/Eigen/src/Geometry/arch/cmake_install.cmake")

endif()

