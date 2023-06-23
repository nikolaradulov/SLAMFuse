#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(0, sqrt(2.)/2, 1);
cout << v.acos() << endl;

  return 0;
}
