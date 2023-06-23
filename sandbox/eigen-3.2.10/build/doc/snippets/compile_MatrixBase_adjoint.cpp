#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Matrix2cf m = Matrix2cf::Random();
cout << "Here is the 2x2 complex matrix m:" << endl << m << endl;
cout << "Here is the adjoint of m:" << endl << m.adjoint() << endl;

  return 0;
}
