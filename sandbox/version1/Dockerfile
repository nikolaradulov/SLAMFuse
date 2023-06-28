FROM ubuntu:20.04
#prepare env
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install cmake -y
RUN apt-get install -y g++

# install the ststic dependency
RUN mkdir library 
RUN mkdir library/src
WORKDIR /library
COPY library/src ./src
COPY library/CMakeLists.txt . 
RUN mkdir build
WORKDIR build
RUN cmake ..
RUN make 
RUN make install 
WORKDIR /

# install dynamic library
RUN mkdir Shared
COPY ./Shared /Shared
WORKDIR Shared
RUN mkdir build
WORKDIR build
RUN cmake ..
RUN make
RUN make install
WORKDIR /

# build the shared library to be loaded
COPY app1.cpp .
RUN g++ -shared -fPIC app1.cpp -o app1.so -lasciidraw

#copy everything on execution
CMD cp -r /usr/local/lib/ /mnt/volume/ \ 
 && cp -r /usr/local/include /mnt/volume/ \ 
 && cp app1.so /mnt/volume/
# ENTRYPOINT ["/bin/bash"]

