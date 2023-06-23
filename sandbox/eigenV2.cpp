// Requires Eigen 3.2
// #include <eigen3/Eigen/Core>
// #include <eigen3/Eigen/LU>

// extern "C" void compute_inverse_eigen(double* matrix_data, double* result_data) {
//     Eigen::Matrix3d A;
//     A << matrix_data[0], matrix_data[1], matrix_data[2],
//          matrix_data[3], matrix_data[4], matrix_data[5],
//          matrix_data[6], matrix_data[7], matrix_data[8];

//     Eigen::FullPivLU<Eigen::Matrix3d> lu_decomp(A);
//     Eigen::Matrix3d A_inv = lu_decomp.inverse();

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
    const int requiredMinorVersion = 2;

    int eigenMajorVersion = EIGEN_WORLD_VERSION;
    int eigenMinorVersion = EIGEN_MAJOR_VERSION;

    std::cout<<eigenMajorVersion<<' '<<eigenMajorVersion<<'\n';
    if (eigenMajorVersion == requiredMajorVersion && eigenMinorVersion == requiredMinorVersion) {
        std::cout << "I got the right version (Eigen 3.2.x)!" << std::endl;
    } else {
        throw std::runtime_error("Incorrect Eigen version detected. Expected Eigen 3.2.x.");
    }
}






