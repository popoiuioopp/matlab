% Question 1 In MATLAB, create vectorsx= (1,2,3,4,5) andy= (1,2,3,4,5) using any two differentmethods.
x = 1 : 1 : 5
y = linspace(1, 5, 5)

% Question 2 Add the two vectors together and examine the output.
s = x + y

% Question 3 Sum the elements of the answer to question 2
sum(s)

% Question 4 Add the 3rd element of x to the last element of y, and assign the output to the variable z
z = x(3) + y(end)

% Question 5 Replace the 4th element of x with 7
x(4) = 7

% Question 6 Extend the vector y with the value 6 so that it has 6 elements.
y(6) = 6

% Question 7 Shorten the vector y by assigning the empty matrix to element 3.
y(3) = []