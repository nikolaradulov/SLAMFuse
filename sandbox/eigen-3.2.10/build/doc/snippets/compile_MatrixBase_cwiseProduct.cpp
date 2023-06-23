#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix3i a = Matrix3i::Random(), b = Matrix3i::Random();
Matrix3i c = a.cwiseProduct(b);
cout << "a:\n" << a << "\nb:\n" << b << "\nc:\n" << c << endl;


  return 0;
}
