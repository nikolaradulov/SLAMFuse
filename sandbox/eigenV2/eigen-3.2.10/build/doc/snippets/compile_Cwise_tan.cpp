#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(M_PI, M_PI/2, M_PI/3);
cout << v.tan() << endl;

  return 0;
}
