%{
11.Create a 6 ​x​ 1 vector of random integers between 20 and 50 called ​z​.
%}
z = randi([20, 50], [6, 1])

%{
12. Write a for loop that subtracts 12 from an element of ​z​ that has a 
value between 27 and 43.
%}
for j = 1 : length(z)
    if z(j) > 27 && z(j) < 43
        z(j) = z(j) - 12;
    end
end
