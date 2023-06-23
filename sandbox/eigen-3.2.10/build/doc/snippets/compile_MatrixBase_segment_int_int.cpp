#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  RowVector4i v = RowVector4i::Random();
cout << "Here is the vector v:" << endl << v << endl;
cout << "Here is v.segment(1, 2):" << endl << v.segment(1, 2) << endl;
v.segment(1, 2).setZero();
cout << "Now the vector v is:" << endl << v << endl;

  return 0;
}
