#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXf m;
m.setConstant(3, 3, 5);
cout << m << endl;

  return 0;
}
