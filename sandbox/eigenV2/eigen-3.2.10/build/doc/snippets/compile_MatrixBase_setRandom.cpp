#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix4i m = Matrix4i::Zero();
m.col(1).setRandom();
cout << m << endl;

  return 0;
}
