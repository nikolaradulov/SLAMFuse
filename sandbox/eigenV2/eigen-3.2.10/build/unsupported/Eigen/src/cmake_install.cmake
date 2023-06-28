# Install script for directory: /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/unsupported/Eigen/src

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/AutoDiff/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/BVH/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/Eigenvalues/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/FFT/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/IterativeSolvers/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/KroneckerProduct/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/LevenbergMarquardt/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/MatrixFunctions/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/MoreVectorization/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/NonLinearOptimization/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/NumericalDiff/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/Polynomials/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/Skyline/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/SparseExtra/cmake_install.cmake")
  include("/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/unsupported/Eigen/src/Splines/cmake_install.cmake")

endif()

