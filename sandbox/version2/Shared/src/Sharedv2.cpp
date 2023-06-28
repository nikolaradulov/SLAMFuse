#include<iostream>

extern "C" void compute_new(){
   std::cout<<"You should see this message if you are using the correct version of the shared library."<<std::endl;
}