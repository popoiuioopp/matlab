%{
15.Solve the following system using LU 
factorisation by finding ​L​ and ​U​ as in question13.

x(1) - 3*x(2) = -5
x(2) + 3*x(3) = -1
2*x(1) - 10*x(2) + 2x(3) = -20
%}
A = [1, -3, 0; 0, 1, 3; 2, -10, 2];
[L,U,P] = lu(A);

%{
16.Solve the above system using LU factorisation but 
use Matlab’s built in​ lu​ function.Note you must account 
for the permutation matrix given by Matlab
%}
B =	[-5;-1;-20];
%{
Ax = B
LU x = B
Ux = L\B
x = U\(L\B)
%}
