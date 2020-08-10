%Question 8 Create three column vectors of length 3 namedc1,c2, andc3. Create a 3x3 matrix calledAusing these column vectors.
c1 = [1 ; 2 ; 3]
c2 = [4 ; 5 ; 6]
c3 = [7 ; 8 ; 9]
[c1(:), c2(:), c3(:)]

%Question 9 Calculate the determinant of the matrix B
B = [1 2 3; 4 5 6; 7 8 9]
det(B)

%Question 10 Calculate the eigenvalues of the matrixB.
eig(B, "matrix")

%Question 11 Create a row vector
a = [3, 6, 9]

%and a column vector
b = [3; 6; 9]

%Question 12 Perform matrix and then element-wise multiplicationon these two vectors. Can you explain the error in the second case?
a * b
a .* b

%Question 13 Transpose the vector a and create a 3x2 matrix called myMat using it with b.
myMat = [transpose(a), b]

%Question 14 Add the second element on the first row to the first element of the second row.
myMat(1,2) + myMat(2,1)