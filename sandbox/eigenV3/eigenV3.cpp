#include <eigen3/Eigen/Core>
#include <iostream>

// to throw compile time error
static_assert(EIGEN_WORLD_VERSION == 3 && EIGEN_MAJOR_VERSION == 3,
              "Incorrect Eigen version detected. Expected Eigen 3.2.x.");

#include <cassert>


 
extern "C" void extract(double xData,  double* result) {

    // Extract the first 3 elements using head()
    Eigen::VectorXd subVector = vector.head(3);
 
    return 0;
}





