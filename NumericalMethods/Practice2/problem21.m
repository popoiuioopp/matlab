%{
21.Write a function that accepts 3 numbers as arguments. 
Add the largest 2 numbers together. Return the result.
%}
function result = problem21(number1, number2, number3)
    list = [number1, number2, number3];
    list = sort(list);
    result = list(2) + list(3);
end