h = @(x) (x^2) - x - exp(-x);
g1 = @(x) (-exp(-x) + x^2);
g2 = @(x) sqrt(exp(-x) + x);
g3 = @(x) -log(x^2 - x);
g4 = @(x) 1 + (exp(-x))/x;
format long;
syms x;
x0 = 1;
tol = 0.0001;
gt = g4;
gd = eval(['@(x)' char(diff(gt(x)))]);
n = 0;

x1 = gt(x0);
while (abs(x0 - x1) > tol)
    x0 = x1;
    x1 = gt(x0);
    if abs(gd(x1)) >= 1
        fprintf("%f, %d, %f, %f\n", gt(x1), n, x0, x1);
        break;
    end
    n = n + 1;
    fprintf("%f, %f = %f\n", x0, x1, x0-x1);
end
fprintf("Total = %d times\n", n);