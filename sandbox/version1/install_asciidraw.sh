#!/bin/bash

# Build and install version 1
echo "Building and installing version 1 of the asciidraw library..."
cd library
mkdir build 
cd build
cmake ..
make
sudo make install
cd ../..

