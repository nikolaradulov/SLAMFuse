FROM ubuntu:20.04
RUN apt-get update && apt-get upgrade -y
COPY loader.cpp .
RUN apt-get install -y g++
RUN g++ loader.cpp -o loader -ldl 
#ENTRYPOINT [ "./loader" ] 