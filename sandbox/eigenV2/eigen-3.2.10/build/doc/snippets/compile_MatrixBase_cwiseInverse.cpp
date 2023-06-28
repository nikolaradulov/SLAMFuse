#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXd m(2,3);
m << 2, 0.5, 1,   
     3, 0.25, 1;
cout << m.cwiseInverse() << endl;

  return 0;
}
