%{
Create a string vector called ​x​ that contains the first 6 letters of the alphabet.
%}
x = 'abcdef';
%{
Display every odd element in the command window with a 2 second pause in between.
%}
for j = 1 : 2 : length(x)
    disp(x(j))
    pause(1)
end
%{
Create a 3 ​x​ 3 string matrix called ​A​ containing the first 9 letters of the alphabet.
%}
A = ["a", "b", "c"; 
    "d", "f", "g"; 
    "h", "i", "i"]

%{
Print the diagonal entries of ​A​ with a 3 second pause in between.  
%}
for j = 1 : 1 : 3
    disp(A(j,j))
end