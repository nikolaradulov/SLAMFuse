#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix3d m = Matrix3d::Random();
cout << "Here is the matrix m:" << endl << m << endl;
cout << "Here is the count of elements larger or equal than 0.5 of each row:" << endl << (m.array() >= 0.5).rowwise().count() << endl;

  return 0;
}
