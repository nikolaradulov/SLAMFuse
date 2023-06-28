#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXi m = MatrixXi::Random(2,3);
cout << "Here is the matrix m:" << endl << m << endl;
cout << "m.replicate<3,2>() = ..." << endl;
cout << m.replicate<3,2>() << endl;

  return 0;
}
