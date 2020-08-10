%{
Write a for loop that doubles the 2nd, 4th and 5th entries of y.
%}
y = [rand(1, 8)*10];
position = [2, 4, 5];
for j = 1:length(position)
  y(position(j)) = y(j)*2;
end