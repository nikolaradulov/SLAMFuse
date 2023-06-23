#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << Matrix2d::Zero() << endl;
cout << RowVector4i::Zero() << endl;

  return 0;
}
