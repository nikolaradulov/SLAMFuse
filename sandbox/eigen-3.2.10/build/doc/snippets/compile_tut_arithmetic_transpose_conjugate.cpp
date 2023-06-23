#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXcf a = MatrixXcf::Random(2,2);
cout << "Here is the matrix a\n" << a << endl;

cout << "Here is the matrix a^T\n" << a.transpose() << endl;


cout << "Here is the conjugate of a\n" << a.conjugate() << endl;


cout << "Here is the matrix a^*\n" << a.adjoint() << endl;



  return 0;
}
