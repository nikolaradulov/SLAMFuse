#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix4i m = Matrix4i::Zero();
m.block<3,3>(1,0).setIdentity();
cout << m << endl;

  return 0;
}
