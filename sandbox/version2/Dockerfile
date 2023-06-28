FROM ubuntu:20.04
#prepare env
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install cmake -y
RUN apt-get install -y g++

# install the ststic dependency
RUN mkdir library2
RUN mkdir library2/src
WORKDIR /library2
COPY library2/src ./src
COPY library2/CMakeLists.txt . 
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
COPY app2.cpp .
RUN g++ -shared -fPIC app2.cpp -o app2.so -lasciidraw

#copy everything on execution
CMD cp -r /usr/local/lib/ /mnt/volume/ \ 
 && cp -r /usr/local/include /mnt/volume/ \ 
 && cp app2.so /mnt/volume/
# ENTRYPOINT ["/bin/bash"]

