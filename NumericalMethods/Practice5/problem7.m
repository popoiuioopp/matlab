syms x
r = @(x) sin(x).*cos(2.*x);
r1 = eval(['@(x)' vectorize(char(diff(r(x))))]);