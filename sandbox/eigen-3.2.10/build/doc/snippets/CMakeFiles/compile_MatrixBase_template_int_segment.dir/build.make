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
CMAKE_SOURCE_DIR = /home/nrad/slambench/sandbox/eigen-3.2.10

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nrad/slambench/sandbox/eigen-3.2.10/build

# Include any dependencies generated for this target.
include doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/depend.make

# Include the progress variables for this target.
include doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/progress.make

# Include the compile flags for this target's objects.
include doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/flags.make

doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o: doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/flags.make
doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o: doc/snippets/compile_MatrixBase_template_int_segment.cpp
doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o: ../doc/snippets/MatrixBase_template_int_segment.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nrad/slambench/sandbox/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o"
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o -c /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets/compile_MatrixBase_template_int_segment.cpp

doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.i"
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets/compile_MatrixBase_template_int_segment.cpp > CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.i

doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.s"
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets/compile_MatrixBase_template_int_segment.cpp -o CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.s

# Object files for target compile_MatrixBase_template_int_segment
compile_MatrixBase_template_int_segment_OBJECTS = \
"CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o"

# External object files for target compile_MatrixBase_template_int_segment
compile_MatrixBase_template_int_segment_EXTERNAL_OBJECTS =

doc/snippets/compile_MatrixBase_template_int_segment: doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/compile_MatrixBase_template_int_segment.cpp.o
doc/snippets/compile_MatrixBase_template_int_segment: doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/build.make
doc/snippets/compile_MatrixBase_template_int_segment: doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nrad/slambench/sandbox/eigen-3.2.10/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable compile_MatrixBase_template_int_segment"
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/compile_MatrixBase_template_int_segment.dir/link.txt --verbose=$(VERBOSE)
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && ./compile_MatrixBase_template_int_segment >/home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets/MatrixBase_template_int_segment.out

# Rule to build all files generated by this target.
doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/build: doc/snippets/compile_MatrixBase_template_int_segment

.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/build

doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/clean:
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets && $(CMAKE_COMMAND) -P CMakeFiles/compile_MatrixBase_template_int_segment.dir/cmake_clean.cmake
.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/clean

doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/depend:
	cd /home/nrad/slambench/sandbox/eigen-3.2.10/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nrad/slambench/sandbox/eigen-3.2.10 /home/nrad/slambench/sandbox/eigen-3.2.10/doc/snippets /home/nrad/slambench/sandbox/eigen-3.2.10/build /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets /home/nrad/slambench/sandbox/eigen-3.2.10/build/doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/snippets/CMakeFiles/compile_MatrixBase_template_int_segment.dir/depend

