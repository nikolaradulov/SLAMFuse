#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Vector3d v(2,3,4), w(4,2,3);
cout << v.cwiseMax(w) << endl;

  return 0;
}
