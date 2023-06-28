
#include <eigen3/Eigen/Core>
#include <iostream>
#include <cassert>

static_assert(EIGEN_WORLD_VERSION == 3 && EIGEN_MAJOR_VERSION == 3,
              "Incorrect Eigen version detected. Expected Eigen 3.2.x.");

extern "C" void extract(double xData,  double* result) {
    Eigen::VectorXd vector(xData);
    // Extract the first 3 elements using head()
    Eigen::VectorXd subVector = vector.start(3);
    std::cout<<subVector<<std::endl;
}



