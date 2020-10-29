hold on;
title('Part 1 | Question 1') 

%Create x to put in the function 
x = linspace(-5, 5); 
 % Plot the graph using function file
plot(x, FunctionPart1(x),'k-');

grid on;

% Plot the zero line
zero = @(x) 0;
fplot(zero);

%Using graph and approximate the x value.
answer = 0.7152;

plot(answer,FunctionPart1(answer),'sb','MarkerSize',10)