FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y upgrade
RUN apt-get -y update 
# time to build slambench
# handle dependencies
RUN apt-get -y install \
    libvtk6.3 \
    libvtk6-dev \
    unzip \
    libflann-dev \
    wget \
    mercurial \
    git \
    gcc \
    g++ \
    cmake \
    python-numpy \
    freeglut3 \
    freeglut3-dev \
    libglew-dev \
    libglu1-mesa \
    libglu1-mesa-dev \
    libgl1-mesa-glx \
    libgl1-mesa-dev \
    libxmu-dev \
    libxi-dev  \
    libboost-all-dev \
    cvs \
    libgoogle-glog-dev \
    libatlas-base-dev \
    gfortran  \
    gtk2.0 \
    libgtk2.0-dev  \
    libyaml-dev \
    build-essential \
    libyaml-cpp-dev
# download git folder
RUN git clone --branch macos https://github.com/nikolaradulov/slambench.git
WORKDIR /slambench
RUN git pull
# RUN git checkout 93fa32123c8878a311ecb02acd2ad8971292a4ab
RUN apt-get install python
COPY entry.sh /slambench
RUN chmod +x /slambench/entry.sh
# COPY ./framework/tools/accuracy-tools/CMakeLists.txt /slambench/framework/tools/accuracy-tools
#COPY ./framework/makefiles/deps.makefile /slambench/framework/makefiles
RUN make eigen3
RUN make flann -j$(expr $(nproc) - 2)
RUN make opencv -j$(expr $(nproc) - 2)
RUN make pangolin -j$(expr $(nproc) - 2)
RUN make pcl -j$(expr $(nproc) - 2)
# build slambench
RUN make slambench
ENTRYPOINT [ "./entry.sh" ]