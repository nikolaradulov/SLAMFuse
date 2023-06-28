FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y
RUN sudo apt remove libeigen3-dev -y
RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz
RUN tar xzf eigen-3.3.9.tar.gz
WORKDIR /eigen-3.3.9/
RUN mkdir build 
RUN cmake ..
WORKDIR build
RUN make
RUN sudo make install
WORKDIR /
COPY eigenV3.cpp .
RUN g++ -shared -fPIC eigenV3.cpp -o eigenV3.so
