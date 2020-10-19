%{
6.Use multiple linear regression to fit the following 
data. Also calculate the standarderror and correlation 
coefficient.
%}
x1 = [0 1 1 2 2 3 3 4 4];
x2 = [0 1 2 1 2 1 2 1 2];
y  = [15.1 17.9 12.7 25.6 20.5 35.1 29.7 45.5 40.2];
n = max(size(x1));
x11 = sum(x1);
x22 = sum(x2);
x1x1 = sum(x1.^2);
x1x2 = sum(x1.*x2);
x2x2 = sum(x2.^2);
y1 = sum(y);
x1y1 = sum(x1 .* y);
x2y1 = sum(x2 .* y);

M = [n x11 x22;
    x11 x1x1 x1x2
    x22 x1x2 x2x2];
B = [y1; x1y1; x2y1];

a = M\B;
a = flip(a)';

%Sr = sum((y - polyval(a, x)).^2);