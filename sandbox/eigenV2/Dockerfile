FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install cmake -y
RUN apt-get install -y g++
RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.2.10/eigen-3.2.10.tar.bz2
RUN tar -xf eigen-3.2.10.tar.bz2
WORKDIR /eigen-3.2.10
RUN mkdir build 
WORKDIR build
RUN cmake ..
RUN make install  
WORKDIR /
COPY eigenV2.cpp .
CMD g++ -shared -fPIC eigenV2.cpp -o /mnt/vol/eigenV2.so && cp -r /usr/local/include/eigen3 /mnt/vol 