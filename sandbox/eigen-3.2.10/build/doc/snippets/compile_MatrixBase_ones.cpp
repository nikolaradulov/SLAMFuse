#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << Matrix2d::Ones() << endl;
cout << 6 * RowVector4i::Ones() << endl;

  return 0;
}
