%Question 15 Create a random 2x2 array and give it a name.
myArray = 10*rand(2)

%Question 16 Round the array to the nearest integer.
round(myArray)

%Question 17 Find the number of elements in the array.
numel(myArray)

%Question 18 Find its maximum and minimum values.
max(myArray(:))
min(myArray(:))

%Question 19 Find the maximum value on the 2nd row using a single command.
max(myArray(2, :))

%Question 20 Create a random vector of length 8 and give it a name.
myArray2 = 10*rand(1, 8)

%Question 21 Sort the vector into ascending order.
myArray2 = sort(myArray2)

%Question 22  Round the 2nd, 4th, 6th and 8th elements up to the nearest integer, and the 1st, 3rd, 5th and 7th elements down to the nearest integer.
for v = [2 4 6 8]
  myArray2(v) = ceil(myArray2(v));
endfor
for v = [1 3 5 7]
  myArray2(v) = floor(myArray2(v));
endfor
myArray2
