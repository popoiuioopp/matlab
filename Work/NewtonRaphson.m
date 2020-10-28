function x1 = NewtonRaphson(f, x0, desire_error)
syms x;
fd = eval(['@(x)' vectorize(char(diff(f(x))))]);
format long;
j = 0;

x1 = fd(x0);
while abs((x1-x0)/x1) * 100 > desire_error
    x0 = x1;
    x1 = x0 - (f(x0)/fd(x0));
    %fprintf("|%f - %f| = %f\n", x0, x1, abs((x1-x0)/x1) * 100);
    j = j+1;
end
%fprintf("Total = %d times\n", j);
end