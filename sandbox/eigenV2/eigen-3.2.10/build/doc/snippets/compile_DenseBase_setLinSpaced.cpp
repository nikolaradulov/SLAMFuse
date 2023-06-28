#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  VectorXf v;
v.setLinSpaced(5,0.5f,1.5f);
cout << v << endl;

  return 0;
}
