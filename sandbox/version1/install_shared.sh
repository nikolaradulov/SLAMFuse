#!/bin/bash
cd Shared
# Create a build directory
mkdir build
cd build

# Generate build files using CMake
cmake ..

# Build the library
make

# Install the library
sudo make install

# Cleanup
cd ..
rm -rf build

echo "Library installed successfully."