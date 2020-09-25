syms x;
m = @(x) cos((x^2)/2) + cos(2*x);
dm = eval(['@(x)' vectorize(char(diff(m(x))))]);
linspace(-pi, pi, 100);
x = [];
for j = linspace(-pi, pi, 100)
    x = [x fzero(dm, j)];
end
x = round(x, 9); x = unique(x);
x(x>pi | x<(-pi)) = [];