function x1 = problem7(x0)
syms x
r = @(x) sin(x)*cos(2*x);
r1 = eval(['@(x)' vectorize(char(diff(r(x))))]);
format long;
tol = 0.0001;
j = 0;

x1 = r1(x0);
while abs(x1-x0) > tol
    x0 = x1;
    x1 = x0 - (r(x0)/r1(x0));
    fprintf("|%f - %f| = %f\n", x0, x1, abs(x0 - x1));
    j = j+1;
end
fprintf("Total = %d times\n", j);
end