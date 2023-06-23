// Requires Eigen 3.3
//#include <eigen3/Eigen/Core>

// extern "C" void compute_inverse_eigen(double* matrix_data, double* result_data) {
//     Eigen::Matrix3d A;
//     A << matrix_data[0], matrix_data[1], matrix_data[2],
//          matrix_data[3], matrix_data[4], matrix_data[5],
//          matrix_data[6], matrix_data[7], matrix_data[8];

//     Eigen::Matrix3d A_inv = A.inverse();

//     result_data[0] = A_inv(0, 0);
//     result_data[1] = A_inv(0, 1);
//     result_data[2] = A_inv(0, 2);
//     result_data[3] = A_inv(1, 0);
//     result_data[4] = A_inv(1, 1);   
//     result_data[5] = A_inv(1, 2);
//     result_data[6] = A_inv(2, 0);
//     result_data[7] = A_inv(2, 1);
//     result_data[8] = A_inv(2, 2);
// }

#include <eigen3/Eigen/Core>
#include <iostream>

extern "C" void checkEigenVersion() {
    const int requiredMajorVersion = 3;
    const int requiredMinorVersion = 3;

    int eigenMajorVersion = EIGEN_WORLD_VERSION;
    int eigenMinorVersion = EIGEN_MAJOR_VERSION;

    if (eigenMajorVersion == requiredMajorVersion && eigenMinorVersion == requiredMinorVersion) {
        std::cout << "I got the right version (Eigen 3.3.x)!" << std::endl;
    } else {
        throw std::runtime_error("Incorrect Eigen version detected. Expected Eigen 3.3.x.");
    }
}



