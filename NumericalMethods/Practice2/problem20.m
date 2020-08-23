%{
20.Write a function that accepts 2 numbers as arguments. If their sum is 
not equal to 10then return false. If it is equal to 10, return true.
%}
function result = problem20(number1, number2)
    if number1 + number2 == 10
        result = true;
    else
        result = false;
    end
end
