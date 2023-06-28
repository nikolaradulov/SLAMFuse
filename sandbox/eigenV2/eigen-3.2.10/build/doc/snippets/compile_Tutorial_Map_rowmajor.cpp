#include <Eigen/Dense>
#include <iostream>

using namespace Eigen;
using namespace std;

int main(int, char**)
{
  cout.precision(3);
  int array[8];
for(int i = 0; i < 8; ++i) array[i] = i;
cout << "Column-major:\n" << Map<Matrix<int,2,4> >(array) << endl;
cout << "Row-major:\n" << Map<Matrix<int,2,4,RowMajor> >(array) << endl;
cout << "Row-major using stride:\n" <<
  Map<Matrix<int,2,4>, Unaligned, Stride<1,4> >(array) << endl;


  return 0;
}
