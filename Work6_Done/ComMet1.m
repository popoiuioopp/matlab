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
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
es = 2;
xi = 0;
xu = 2;
xo = xi;
count = 0   ;
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
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
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
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
total_iteration = 10; 
bisection_error = [];
newton_error =[];

xi = 0;
xu = 2;
xo = xi;
count = 0;
while count < total_iteration+1
    xm = (xi+xu)/2;
    if f(xu)*f(xm) > 0
        xu = xm;
    elseif f(xi)*f(xm) > 0
        xi = xm;
    end 
    error = 100 * abs((xm-xo)/xm);
    bisection_error = [bisection_error error];
    count = count + 1;
    xo = xm;
end
bisection_error(1) = [];

xn = 1;
x_old = 100;
count = 0;
syms x;
f_div = matlabFunction(diff(f(x))); 
while count < total_iteration
    x_old = xn;
    xn = xn - (f(xn))/(f_div(xn));
    error = 100 * abs((xn-x_old)/xn);
    newton_error = [newton_error error];
    count = count + 1;
end
newton_error = [100 newton_error];
newton_error(end) = [];

subplot(4,1,4);
title('4')
hold on;
grid on;
plot(linspace(1, total_iteration, max(size(bisection_error))), bisection_error);
plot(linspace(1, total_iteration, max(size(newton_error))), newton_error);
legend('Bisection Method','Newton-Raphson Method');
xlabel('Iteration');
ylabel('Relative Errors');
