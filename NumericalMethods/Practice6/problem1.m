%{
1.Use the ​eye​ function to create a diagonal 
matrix called ​A​ with 7’s on the leadingdiagonal.
%}
A = eye(7);
A(A==1) = 7;

%{
2.Create a 3 x 3 elementary matrix called ​E​ that 
adds 3 of the 1st row to the 3rd row of a matrix.
%}
E = eye(3);
E(3, :) = E(3, :) + E(1, :)*3;

%{
3.Create a random 3 x 3 matrix of integers between 
-10 and 10 called ​B​ then alter it by adding 3 times 
the 1st row to the 3rd row by left-multiplying ​B​ by 
the matrix ​E​
%}
B = randi([-10 10], 3, 3);
B = E*B;

%{
4.Augment the result from question 3 with a 3 x 3 
identity matrix then use Matlab’s rref​ function to 
find it’s reduced echelon form.
%}
disp(rref(B));


