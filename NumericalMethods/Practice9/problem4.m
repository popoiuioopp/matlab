%{
Use any built-in Matlab functions to do inverse 
interpolation to estimate the value ofx at which 
f(x) = 1.7.
%}
x = [1 2 3 4 5 6 7];
y = [3.6 1.8 1.2 0.9 0.72 1.5 0.51429];
xx = x(1:2);
yy = y(1:2);
a = polyfit(xx,yy,1);
xxx = linspace(min(x), 2);
yyy = polyval(a, xxx);
hold on;
scatter(x,y,'filled');
plot(xxx, yyy);
