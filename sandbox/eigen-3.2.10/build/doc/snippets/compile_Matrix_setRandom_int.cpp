#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  VectorXf v;
v.setRandom(3);
cout << v << endl;

  return 0;
}
