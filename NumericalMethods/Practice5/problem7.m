syms x
r = @(x) exp(-x) - x;
r1 = eval(['@(x)' vectorize(char(diff(r(x))))]);
format long;
x = 10;
n = 6;
i = 0;
while i <= n
    x = x - (r(x)/r1(x));
    disp(x);
    i = i+1;
end