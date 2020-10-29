function x1 = NewtonRaphson(f, x0, desire_error)
syms x;
fd = eval(['@(x)' vectorize(char(diff(f(x))))]);
format long;
count = 0;

x1 = fd(x0);
error = 100;
while error > desire_error
    count = count + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/fd(x0));
    error = abs((x1-x0)/x1) * 100;
    fprintf("\nError = %f %% & Iteration = %d\nx1 = %f\n", error, count, x1);
end
%fprintf("\nResult = %f\n", x1);
disp("----------------");
end