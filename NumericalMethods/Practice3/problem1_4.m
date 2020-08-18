%{
1. Create a cell array (don’t forget to give it a name) where the first element 
is a random 3 x 4matrix of integers, the second element is vector with 200 
elements ranging from -10 to 10, andthe third element is a string of your choice.
%}
myarray = {rand(3,4), linspace(-10, 10, 200), 'mystring'};

%{
2. Request the user input for an entry in the 3 x 4 matrix. Your code should 
check that the userentered a valid pair of numbers and display a warning 
message if not.
%}
check = 1;
while check == 1   
    indx = input('Enter the x axis: ');
    indy = input('Enter the y axis: ');
    if indx <= 3 && indy <= 4
      res = myarray{1}(indx, indy)
      check = 0;
    else
      disp('Invalid number')
    end
end
%{
3. Create a new vector that is the vector in the cell array multiplied by the 
number in the matrixspecified by the user, then insert this new vector as the 
third element of the cell array and shiftthe previous third element (string) 
to the fourth position of the cell array.
%}
multiply_num = input('Enter the mutiply number: ');
myarray(4) = myarray(3);
myarray{3} = myarray{2} * multiply_num;;

%{
4. Plot the 2 vectors from your cell array against each other in one line of code.
%}
plot(myarray{2}, myarray{3},'b.--')