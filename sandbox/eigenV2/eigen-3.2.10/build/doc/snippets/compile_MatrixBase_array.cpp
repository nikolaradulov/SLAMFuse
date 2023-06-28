#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Vector3d v(1,2,3);
v.array() += 3;
v.array() -= 2;
cout << v << endl;

  return 0;
}
