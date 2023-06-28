#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  MatrixXd ones = MatrixXd::Ones(3,3);
SelfAdjointEigenSolver<MatrixXd> es(ones);
cout << "The eigenvalues of the 3x3 matrix of ones are:" 
     << endl << es.eigenvalues() << endl;

  return 0;
}
