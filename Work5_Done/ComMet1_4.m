number = 10; 

% Bisection method

count = 0; 
xl = 0; 
xu = 1; 
mid = (xl + xu)/2; 
bisec = []; 

while count < number 
    
    count = count + 1;
    xp = mid; 
    
    if FunctionPart1(xl) * FunctionPart1(mid) < 0
        xu = mid;
        
    elseif FunctionPart1(xu) * FunctionPart1(mid) < 0
        xl = mid;
        
    end
    
    mid = (xl + xu)/2;
    xc = mid;
    bisec(end+1) = abs((xc-xp)/xc*100);
end

%Newton-Raphson
count = 0; 
x0 = 1; 
syms x; 
f1 = matlabFunction(diff(FunctionPart1(x)));

x1 = f1(x0);
newton = [];

while count < number
    count = count + 1;
    x0 = x1;
    x1 = x0 - (FunctionPart1(x0)/f1(x0));
    newton(end+1) = abs((x1-x0)/x1*100);
end


title('Part 1 | Question 4') 
hold on;
error_bisection(1) = 100; error_newton(1) = 100;

plot(linspace(1,number,number), bisec,'k-');
plot(linspace(1,number,number), newton,'r-');
grid on;

legend({'Bisection','Newton'},'Location','northwest');
xlabel('Number');
ylabel('Error');