#include <asciidraw.h>
#include <dlfcn.h>
#include <cassert>
#include <iostream>

static_assert(ASCIIDRAW_VERSION_MAJOR == 1 ,
              "Incorrect AsciiDraw version detected. Expected 1.0");

typedef void (*ComputeNewFunction)();

extern "C" int mock(){
    AsciiDraw::draw();
    // Load the shared library
    void* libraryHandle = dlopen("/usr/local/lib/libmylibrary.so", RTLD_LAZY);

    // Check that the library was loaded successfully
    if (!libraryHandle) {
        std::cerr << "Failed to load the shared library: " << dlerror() << std::endl;
        return 1;
    }

    // Load the function from the shared library
    ComputeNewFunction computeNew = reinterpret_cast<ComputeNewFunction>(dlsym(libraryHandle, "compute"));

    // Check if the function was loaded successfully
    if (!computeNew) {
        std::cerr << "Failed to load the function: " << dlerror() << std::endl;
        dlclose(libraryHandle);
        return 1;
    }

    // Call the function
    computeNew();

    // Unload the shared library
    dlclose(libraryHandle);
    return 0;
}
