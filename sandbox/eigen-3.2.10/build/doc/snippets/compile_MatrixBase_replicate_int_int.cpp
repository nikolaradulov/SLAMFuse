#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  Vector3i v = Vector3i::Random();
cout << "Here is the vector v:" << endl << v << endl;
cout << "v.replicate(2,5) = ..." << endl;
cout << v.replicate(2,5) << endl;

  return 0;
}
