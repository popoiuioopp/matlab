%{
14.Write a script that finds the LU factorisation of the 
matrix ​A​ using Gaussian elimination to find ​U​ and the 
formulas given in lecture notes 6 to find ​L
%}
function [L,U,P] = problem14(result)
    [L,U,P] = lu(result);
end