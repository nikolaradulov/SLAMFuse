#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(1,2,3);
v += 5;
cout << v << endl;

  return 0;
}
