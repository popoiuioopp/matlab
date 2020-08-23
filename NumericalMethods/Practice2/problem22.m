%{
22.Write a function that accepts 3 numbers as arguments. Subtract the 
smallest numberfrom the largest. Return the result.
%}
function result = problem22(number1, number2, number3)
    list = sort([number1, number2, number3]);
    result = list(3) - list(1);
end
