#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << MatrixXd::Identity(4, 3) << endl;

  return 0;
}
