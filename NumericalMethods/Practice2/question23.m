%{
Write a function that accepts a vector as an input argument. The function 
should print the number of elements of the input vector as well as its 
smallest 2 values. If the vector has less than 2 elements the function 
should tell the user it requires more inputs.
%}
function result = question23(numbers)
  if length(numbers) < 2
    disp(["The vector size is less than 2. Try again"])
    return
  endif
  disp(['The length is ', num2str(length(numbers))])
  sort(numbers)([1 2])
endfunction
