#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(8,27,64);
cout << v.pow(0.333333) << endl;

  return 0;
}
