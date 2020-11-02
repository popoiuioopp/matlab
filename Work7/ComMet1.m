%QUESTION 1%
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
subplot(2,2,1);
hold on;
fplot(f);
title('question 1') 
n = 100;
estimate = 0.651914;
plot(linspace(-5,5,n), zeros(n)); 
grid on;
plot(estimate, f(estimate), '*r');

%QUESTION 2%
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
subplot(2,2,2);
hold on;
error = 2; 
a = 0; b = 1; 
while abs(b - a)/2 * 100 > error
    c = (a+b)/2;
    if f(b)*f(c) > 0
        b = c;
    else
        a = c;
    end
end
estRoot = (a+b)/2;
title('question 2')
fplot(f);
plot(estRoot, f(estRoot), '*r');
grid on;

%QUESTION 3%
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
syms x;
df = eval(['@(x)' vectorize(char(diff(f(x))))]);
subplot(2,2,3);
title('question 3') 
hold on;
fplot(f);
count = 0;
x0 = 1;
x1 = df(x0);
cur_error = 100;
error = 2;
while cur_error > error
    count = count + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/df(x0));
    cur_error = abs((x1-x0)/x1) * 100;
end
grid on;
plot(x1, f(x1), '*r');

%QUESTION 4%
f = @(x) 5-(5.*x)+(-exp(0.5.*x));
iter = 10; 
b_error = [];

a = 0; b = 1; count = 0;
while iter > count
    count = count + 1;
    c = (a+b)/2;
    if f(b)*f(c) > 0
        b = c;
    else
        a = c;
    end
    b_error = [b_error abs(b - a)/2 * 100];
end
estRoot = (a+b)/2;

n_error =[];
count = 0;
x0 = 1;
x1 = df(x0);
cur_error = 100;
error = 2;
while iter > count
    count = count + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/df(x0));
    cur_error = abs((x1-x0)/x1) * 100;
    n_error = [n_error abs((x1-x0)/x1) * 100];
end
index = find(n_error > 100);
n_error(index) = 100;

subplot(2,2,4);
title('question 4')
hold on;grid on;
plot(linspace(1, iter, max(size(b_error))), b_error, linspace(1, iter, max(size(n_error))), n_error);
legend('Bisection Method','Newton-Raphson Method');