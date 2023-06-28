rm -rf eigen-*
sudo apt-get remove libeigen3-dev
wget https://gitlab.com/libeigen/eigen/-/archive/3.2.10/eigen-3.2.10.tar.bz2
tar -xf eigen-3.2.10.tar.bz2
cd eigen-3.2.10
mkdir build && cd build
cmake ..
sudo make install 
pkg-config --modversion eigen3 

