rm -rf eigen-*
# Step 1: Check current version
echo "Current Eigen version:"
pkg-config --modversion eigen3

# Step 2: Remove existing Eigen
sudo apt remove libeigen3-dev -y

# Step 3: Download Eigen 3.3
echo "Downloading Eigen 3.3..."
wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz
tar xzf eigen-3.3.9.tar.gz

# Step 4: Build and install Eigen 3.3
cd eigen-3.3.9/
mkdir build && cd build
echo "Building Eigen 3.3..."
cmake ..
make
sudo make install

# Step 5: Verify installation
echo "Upgraded Eigen version:"
pkg-config --modversion eigen3

echo "Eigen upgrade complete!"

