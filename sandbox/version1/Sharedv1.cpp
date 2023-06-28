#include<iostream>

extern "C" void compute(){
   std::<<"You should see this message if you are using the correct version of the shared library."<<std::endl;
}