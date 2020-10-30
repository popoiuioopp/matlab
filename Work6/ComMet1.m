clf;
%-------------------1-------------------%
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
subplot(4,1,1);
hold on;
fplot(f);
title('1') 
plot(linspace(-10,10,100), zeros(100), '--');
x = 0.707071; 
plot(x, f(x), 'or', 'MarkerFaceColor', 'b'); 

%-------------------2-------------------%
es = 2;
xi = 0;
xu = 2;
xo = xi;
count = 0;
ea = 100;
while ea>es
    xm = (xi+xu)/2;
    %fprintf("%f, %f, %f\n", f(xi), f(xu), f(xm));
    if f(xu)*f(xm) > 0
        xu = xm;
    elseif f(xi)*f(xm) > 0
        xi = xm;
    end 
    ea = 100 * abs((xm-xo)/xm);
    count = count + 1;
    xo = xm;
    %fprintf("%f, %f, %f, %f, %f, %f, %f\n",xi, xu, xo, f(xi), f(xu), f(xo), ea)
end
subplot(4,1,2);
hold on;
title('2')
fplot(f)
plot(xm, f(xm), 'or', 'MarkerFaceColor', 'b');


%-------------------3-------------------%
xn = 1;
x_old = 100;
count = 0;
error = 2;
syms x;
f_div = matlabFunction(diff(f(x))); 
while abs(x_old-xn)/xn * 100 > error 
    x_old = xn;
    xn = xn - (f(xn))/(f_div(xn));
    count = count + 1;
end
subplot(4,1,3);
hold on;
title('3')
fplot(f); 
plot(xn, f(xn), 'or', 'MarkerFaceColor', 'b');


%-------------------4-------------------%
n = 20; 
iteration = 0; 
xl = -1; 
xu = 1; 
midpoint = (xl + xu)/2;
error_bisection = []; 
while iteration < n
    iteration = iteration + 1;
    previous = midpoint; 
    if f(xl) * f(midpoint) < 0
        xu = midpoint;
    elseif f(xu) * f(midpoint) < 0
        xl = midpoint;
    end
    midpoint = (xl + xu)/2;
    current = midpoint;
    error_bisection(iteration) = abs((current - previous)/current); % Add the error value to vector.
end

%Newton-Raphson
n = 20;
iteration = 0;
x0 = 1;
syms x;
f1 = matlabFunction(diff(f(x)));
x1 = f1(x0);
error_newton = [];
while iteration < n
    iteration = iteration + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/f1(x0));
    error_newton(iteration) = abs((x1-x0)/x1);
end


figure('Name', 'Question 4');
title('Question 4')
hold on;
error_bisection(1) = []; 
error_newton(1) = [];
plot(linspace(1,n-1,n-1), error_bisection,'g-');
plot(linspace(1,n-1,n-1), error_newton,'c-');
legend('Bisection','Newton-Raphson');
xlabel('Iteration');
ylabel('Relative Errors');
