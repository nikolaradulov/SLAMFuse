#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Vector3d v(1,2,4);
cout << v.cwiseSqrt() << endl;

  return 0;
}
