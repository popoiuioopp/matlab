syms x;
f1 = matlabFunction(diff(FunctionPart1(x))); %f'(x) 
x0 = 0; % Initial point
x1 = f1(x0); 
a_error = 2; %Error we want 

while abs((x1-x0)/x1) * 100 > a_error % While the error still not satisfied
    x0 = x1;
    x1 = x0 - (FunctionPart1(x0)/f1(x0));
end
answer = x1;

hold on;
title('Part 1 | Question 3') 

%Create x to put in the function 
x = linspace(-5, 5); 
 % Plot the graph using function file
plot(x, FunctionPart1(x),'k-');

% Plot the zero line
zero = @(x) 0;
fplot(zero);

grid on;

 %Plot the point
plot(answer,FunctionPart1(answer),'sb','MarkerSize',10)