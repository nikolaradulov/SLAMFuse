#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << RowVectorXi::Zero(4) << endl;
cout << VectorXf::Zero(2) << endl;

  return 0;
}
