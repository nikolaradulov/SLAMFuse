#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << 6 * RowVectorXi::Ones(4) << endl;
cout << VectorXf::Ones(2) << endl;

  return 0;
}
