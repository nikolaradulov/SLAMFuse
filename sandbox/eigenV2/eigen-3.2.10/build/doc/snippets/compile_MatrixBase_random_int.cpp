#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << VectorXi::Random(2) << endl;

  return 0;
}
