#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << Matrix3i(Vector3i(2,5,6).asDiagonal()) << endl;

  return 0;
}
