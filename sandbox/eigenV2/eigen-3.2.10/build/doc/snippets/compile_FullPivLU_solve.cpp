#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix<float,2,3> m = Matrix<float,2,3>::Random();
Matrix2f y = Matrix2f::Random();
cout << "Here is the matrix m:" << endl << m << endl;
cout << "Here is the matrix y:" << endl << y << endl;
Matrix<float,3,2> x = m.fullPivLu().solve(y);
if((m*x).isApprox(y))
{
  cout << "Here is a solution x to the equation mx=y:" << endl << x << endl;
}
else
  cout << "The equation mx=y does not have any solution." << endl;

  return 0;
}
