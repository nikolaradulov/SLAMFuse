# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build

# Include any dependencies generated for this target.
include test/CMakeFiles/geo_transformations_8.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/geo_transformations_8.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/geo_transformations_8.dir/flags.make

test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o: test/CMakeFiles/geo_transformations_8.dir/flags.make
test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o: ../test/geo_transformations.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o -c /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/geo_transformations.cpp

test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.i"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/geo_transformations.cpp > CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.i

test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.s"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/geo_transformations.cpp -o CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.s

# Object files for target geo_transformations_8
geo_transformations_8_OBJECTS = \
"CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o"

# External object files for target geo_transformations_8
geo_transformations_8_EXTERNAL_OBJECTS =

test/geo_transformations_8: test/CMakeFiles/geo_transformations_8.dir/geo_transformations.cpp.o
test/geo_transformations_8: test/CMakeFiles/geo_transformations_8.dir/build.make
test/geo_transformations_8: test/CMakeFiles/geo_transformations_8.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable geo_transformations_8"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/geo_transformations_8.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/geo_transformations_8.dir/build: test/geo_transformations_8

.PHONY : test/CMakeFiles/geo_transformations_8.dir/build

test/CMakeFiles/geo_transformations_8.dir/clean:
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && $(CMAKE_COMMAND) -P CMakeFiles/geo_transformations_8.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/geo_transformations_8.dir/clean

test/CMakeFiles/geo_transformations_8.dir/depend:
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10 /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test/CMakeFiles/geo_transformations_8.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/geo_transformations_8.dir/depend

