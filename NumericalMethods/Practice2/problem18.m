%{
Write a function that accepts a number as an argument. Check if it is 
even or odd. If itis even, add 1 to it. If it is odd, subtract 1 from it. 
Return the value.
%}
function result = problem18(number)
  if mod(number, 2) == 0
    result = number + 1;
  else
    result = number - 1;
  endif
endfunction
