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
include test/CMakeFiles/dontalign_4.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/dontalign_4.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/dontalign_4.dir/flags.make

test/CMakeFiles/dontalign_4.dir/dontalign.cpp.o: test/CMakeFiles/dontalign_4.dir/flags.make
test/CMakeFiles/dontalign_4.dir/dontalign.cpp.o: ../test/dontalign.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/dontalign_4.dir/dontalign.cpp.o"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dontalign_4.dir/dontalign.cpp.o -c /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/dontalign.cpp

test/CMakeFiles/dontalign_4.dir/dontalign.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dontalign_4.dir/dontalign.cpp.i"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/dontalign.cpp > CMakeFiles/dontalign_4.dir/dontalign.cpp.i

test/CMakeFiles/dontalign_4.dir/dontalign.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dontalign_4.dir/dontalign.cpp.s"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test/dontalign.cpp -o CMakeFiles/dontalign_4.dir/dontalign.cpp.s

# Object files for target dontalign_4
dontalign_4_OBJECTS = \
"CMakeFiles/dontalign_4.dir/dontalign.cpp.o"

# External object files for target dontalign_4
dontalign_4_EXTERNAL_OBJECTS =

test/dontalign_4: test/CMakeFiles/dontalign_4.dir/dontalign.cpp.o
test/dontalign_4: test/CMakeFiles/dontalign_4.dir/build.make
test/dontalign_4: test/CMakeFiles/dontalign_4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dontalign_4"
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dontalign_4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/dontalign_4.dir/build: test/dontalign_4

.PHONY : test/CMakeFiles/dontalign_4.dir/build

test/CMakeFiles/dontalign_4.dir/clean:
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test && $(CMAKE_COMMAND) -P CMakeFiles/dontalign_4.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/dontalign_4.dir/clean

test/CMakeFiles/dontalign_4.dir/depend:
	cd /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10 /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/test /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test /home/nrad/slambench/sandbox/eigenV2/eigen-3.2.10/build/test/CMakeFiles/dontalign_4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/dontalign_4.dir/depend

