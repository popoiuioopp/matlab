%Question 23 Generate a random 9x9 matrix of integers (whole numbers) calledC.
C = randi([0, 10], 9, 9)

%Question 24 Add the 4th column of C to the 6th column.
C(4, :) + C(6, :)

%Question 25 Create a 3x3 matrixDfrom the top left minor of matrixC, and a matrixEfrom the bottomright minor of matrixC
D = [C(1,1:3); C(2,1:3); C(3,1:3)]
E = [C(7,6:end); C(8,6:end); C(9,6:end)]

%Quesiton 26 Perform the element-wise multiplication DE and ED.
%D.*E
%E.*D

%Question 27 Perform the matrix multiplication DE and ED.
%D*E
%E*D
