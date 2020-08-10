%{
Write a function that accepts 2 numbers as arguments. Check if they are equal 
to each other. If they are, then add them. If they are not, then return the 
absolute valueof their difference.
%}
function result = problem19(number1, number2)
  if number1 == number2
    result = number1 + number2;
  else
    result = abs(number1 - number2);
  endif
endfunction
