#include <iostream>
#include <dlfcn.h>

//define function type
typedef void (*ComputeInverseEigenFunc)();

int main(int argc, char** argv) {
    // load the shared library
    std::cout<<"Tryting to open "<<argv[1]<<"...\n";
    void* libraryHandle = dlopen(argv[1], RTLD_LAZY);
    // check that the library was loaded successfully 
    if (!libraryHandle) {
        std::cerr << "Failed to load the shared library: " << dlerror() << std::endl;
        return 1;
    }

    // load the function from the shared library
    // assign correct type to retrieved function
    std::cout<<"Searching for function...\n";
    ComputeInverseEigenFunc computeInverseEigen = reinterpret_cast<ComputeInverseEigenFunc>(dlsym(libraryHandle, "checkEigenVersion"));
    // checl function was successfully loaded
    if (!computeInverseEigen) {
        std::cerr << "Failed to load the function: " << dlerror() << std::endl;
        dlclose(libraryHandle);
        return 1;
    }

    

    // resulting inverse data
    double inverseData[9];

    std::cout<<"Computing the inverse\n";
    // call the function
    computeInverseEigen();

    // // print the resulting inverse matrix
    // std::cout << "Inverse Matrix:" << std::endl;
    // for (int i = 0; i < 3; ++i) {
    //     for (int j = 0; j < 3; ++j) {
    //         std::cout << inverseData[i * 3 + j] << " ";
    //     }
    //     std::cout << std::endl;
    // }

    // // close the shared library
    // dlclose(libraryHandle);

    // return 0;
}
