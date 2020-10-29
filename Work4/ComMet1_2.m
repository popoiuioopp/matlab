xl = 0.5; 
xu = 1;
a_error = 2;

mid = (xl+xu)/2;
xc = xu;
xp = xl;
if FunctionPart1(xl) * FunctionPart1(xu) > 0
    fprintf('\nError!! Data points can not be used.\n');
    return;
end

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
title('Part 1 | Question 2') 

%Create x to put in the function 
x = linspace(-5, 5); 
 % Plot the graph using function file
plot(x, FunctionPart1(x),'k-');

grid on;

% Plot the zero line
zero = @(x) 0;
fplot(zero);

plot(answer,FunctionPart1(answer),'sb','MarkerSize',10) %Plot the point