#!/bin/bash

if [[ $# != 1 || $1 == *help ]]
then
  echo "usage: ./check regexp"
  echo "  Builds tests matching the regexp."
  echo "  The EIGEN_MAKE_ARGS environment variable allows to pass args to 'make'."
  echo "    For example, to launch 5 concurrent builds, use EIGEN_MAKE_ARGS='-j5'"
  exit 0
fi

TESTSLIST="rand
meta
sizeof
dynalloc
nomalloc
first_aligned
mixingtypes
packetmath
unalignedassert
vectorization_logic
basicstuff
linearstructure
integer_types
cwiseop
unalignedcount
exceptions
redux
visitor
block
corners
product_small
product_large
product_extra
diagonalmatrices
adjoint
diagonal
miscmatrices
commainitializer
smallvectors
mapped_matrix
mapstride
mapstaticmethods
array
array_for_matrix
array_replicate
array_reverse
ref
triangular
selfadjoint
product_selfadjoint
product_symm
product_syrk
product_trmv
product_trmm
product_trsolve
product_mmtr
product_notemporary
stable_norm
bandmatrix
cholesky
lu
determinant
inverse
qr
qr_colpivoting
qr_fullpivoting
upperbidiagonalization
hessenberg
schur_real
schur_complex
eigensolver_selfadjoint
eigensolver_generic
eigensolver_complex
real_qz
eigensolver_generalized_real
jacobi
jacobisvd
geo_orthomethods
geo_homogeneous
geo_quaternion
geo_transformations
geo_eulerangles
geo_hyperplane
geo_parametrizedline
geo_alignedbox
stdvector
stdvector_overload
stdlist
stdlist_overload
stddeque
stddeque_overload
resize
sparse_vector
sparse_basic
sparse_product
sparse_solvers
umeyama
householder
swap
conservative_resize
permutationmatrices
sparse_permutations
nullary
nesting_ops
zerosized
dontalign
sizeoverflow
prec_inverse_4x4
vectorwiseop
special_numbers
rvalue_types
mpl2only
simplicial_cholesky
conjugate_gradient
bicgstab
sparselu
sparseqr
eigen2support
superlu_support
NonLinearOptimization
NumericalDiff
autodiff
BVH
matrix_exponential
matrix_function
matrix_power
matrix_square_root
alignedvector3
FFT
sparse_extra
openglsupport
polynomialsolver
polynomialutils
kronecker_product
splines
gmres
minres
levenberg_marquardt
bdcsvd
"
targets_to_make=`echo "$TESTSLIST" | egrep "$1" | xargs echo`

if [ -n "${EIGEN_MAKE_ARGS:+x}" ]
then
  make $targets_to_make ${EIGEN_MAKE_ARGS}
else
  make $targets_to_make
fi
exit $?

