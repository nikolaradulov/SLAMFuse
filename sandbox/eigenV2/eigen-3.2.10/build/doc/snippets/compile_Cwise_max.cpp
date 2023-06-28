#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Array3d v(2,3,4), w(4,2,3);
cout << v.max(w) << endl;

  return 0;
}
