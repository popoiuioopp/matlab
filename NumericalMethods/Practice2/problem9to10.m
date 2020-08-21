%{
Create a 1 ​x​ 8 vector of random integers called ​y​.
%}
y = randi([0 100], 1, 8)

%{
Write a for loop that replaces elements of ​y​ that have an even value with 0 and elements thathave an odd value with 1.
%}
for j = 1 : 1 : length(y)
    if mod(y(j), 2) == 0
        y(j) = 0;
    else 
        y(j) = 1;
    end
end
disp(y)

