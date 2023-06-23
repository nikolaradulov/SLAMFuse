#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXf m;
m.setZero(3, 3);
cout << m << endl;

  return 0;
}
