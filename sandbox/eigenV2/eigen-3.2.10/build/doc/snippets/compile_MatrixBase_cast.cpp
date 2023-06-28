#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix2d md = Matrix2d::Identity() * 0.45;
Matrix2f mf = Matrix2f::Identity();
cout << md + mf.cast<double>() << endl;

  return 0;
}
