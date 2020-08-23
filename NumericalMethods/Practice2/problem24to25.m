%{
24. Write a script that creates a random vector of 1’s and 0’s then finds the 
indexes of thenon-zero elements (read about the find function).
%}
vec1 = randi([0, 1], [1 3]);
find(vec1)

%{
25.Write a script which creates a random 4 ​x​ 4 matrix of integers, then 
finds the even numbers and sets them equal to 0. The final matrix should be
only odd numbers and 0 values.
%}
vec2 = randi([1, 100], 4);
even_indexes = find(mod(vec2, 2) == 0);
for j = 1 : length(even_indexes)
    vec2(even_indexes(j)) = 0;
end
