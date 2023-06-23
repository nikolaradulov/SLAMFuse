#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  int array[24];
for(int i = 0; i < 24; ++i) array[i] = i;
cout << Map<MatrixXi, 0, Stride<Dynamic,2> >
         (array, 3, 3, Stride<Dynamic,2>(8, 2))
     << endl;

  return 0;
}
