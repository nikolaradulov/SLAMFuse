#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  cout << 100 * Matrix2i::Random() << endl;

  return 0;
}
