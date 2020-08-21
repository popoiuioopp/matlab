%{
Write a for loop that doubles the 2nd, 4th and 5th entries of y.
%}
y = randi([0 100], 1, 8);
position = [2, 4, 5];
for j = 1:length(position)
  y(position(j)) = y(j)*2;
end