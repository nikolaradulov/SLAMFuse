#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix3d m = Matrix3d::Identity();
m.row(1) = Vector3d(4,5,6);
cout << m << endl;

  return 0;
}
