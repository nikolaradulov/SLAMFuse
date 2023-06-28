#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(2,3,4);
cout << v.cube() << endl;

  return 0;
}
