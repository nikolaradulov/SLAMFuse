# Build and install version 2
echo "Building and installing version 2 of the asciidraw library..."
cd library2
mkdir build 
cd build
cmake ..
make
sudo make install
cd ../..

echo "Library installation complete."
