%Question 5.12 in text book.
f = @(x) (-2.*x.^6)-(1.5.*x.^4)+(10.*x) + 2;
syms x;
f1 = matlabFunction(diff(FunctionPart1(x))); 

xl = 0.5; 
xu = 1;
a_error = 5;

mid = (xl+xu)/2;
xc = xu;
xp = xl;

while abs((xc - xp)/xc * 100) > a_error
    xp = mid;
    
    if FunctionPart1(xl) * FunctionPart1(mid) < 0
        xu = mid;
        
    elseif FunctionPart1(xu) * FunctionPart1(mid) < 0
        xl = mid;
        
    end
    mid = (xl + xu)/2;
    xc = mid;
end

answer = xc;

hold on;

%Create x to put in the function 
x = linspace(-5, 5); 
%Plot the graph using function file
plot(x, f(x),'k-');

%Plot the point where f'(x) = 0;

plot(answer,f(answer),'sb','MarkerSize',10)

%Plot the zero line
zero = @(x) 0;
fplot(zero);