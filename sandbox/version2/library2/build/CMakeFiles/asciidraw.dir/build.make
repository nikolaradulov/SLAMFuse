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
CMAKE_SOURCE_DIR = /home/nrad/slambench/sandbox/version2/library2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nrad/slambench/sandbox/version2/library2/build

# Include any dependencies generated for this target.
include CMakeFiles/asciidraw.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/asciidraw.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/asciidraw.dir/flags.make

CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o: CMakeFiles/asciidraw.dir/flags.make
CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o: ../src/asciidraw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nrad/slambench/sandbox/version2/library2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o -c /home/nrad/slambench/sandbox/version2/library2/src/asciidraw.cpp

CMakeFiles/asciidraw.dir/src/asciidraw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/asciidraw.dir/src/asciidraw.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nrad/slambench/sandbox/version2/library2/src/asciidraw.cpp > CMakeFiles/asciidraw.dir/src/asciidraw.cpp.i

CMakeFiles/asciidraw.dir/src/asciidraw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/asciidraw.dir/src/asciidraw.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nrad/slambench/sandbox/version2/library2/src/asciidraw.cpp -o CMakeFiles/asciidraw.dir/src/asciidraw.cpp.s

# Object files for target asciidraw
asciidraw_OBJECTS = \
"CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o"

# External object files for target asciidraw
asciidraw_EXTERNAL_OBJECTS =

libasciidraw.a: CMakeFiles/asciidraw.dir/src/asciidraw.cpp.o
libasciidraw.a: CMakeFiles/asciidraw.dir/build.make
libasciidraw.a: CMakeFiles/asciidraw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nrad/slambench/sandbox/version2/library2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libasciidraw.a"
	$(CMAKE_COMMAND) -P CMakeFiles/asciidraw.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/asciidraw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/asciidraw.dir/build: libasciidraw.a

.PHONY : CMakeFiles/asciidraw.dir/build

CMakeFiles/asciidraw.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/asciidraw.dir/cmake_clean.cmake
.PHONY : CMakeFiles/asciidraw.dir/clean

CMakeFiles/asciidraw.dir/depend:
	cd /home/nrad/slambench/sandbox/version2/library2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nrad/slambench/sandbox/version2/library2 /home/nrad/slambench/sandbox/version2/library2 /home/nrad/slambench/sandbox/version2/library2/build /home/nrad/slambench/sandbox/version2/library2/build /home/nrad/slambench/sandbox/version2/library2/build/CMakeFiles/asciidraw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/asciidraw.dir/depend

