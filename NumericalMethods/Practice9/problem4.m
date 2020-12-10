%{
Use any built-in Matlab functions to do inverse 
interpolation to estimate the value of x at which 
f(x) = 1.7.
%}
x = [1 2 3 4 5 6 7];
y = [3.6 1.8 1.2 0.9 0.72 1.5 0.51429];

a = polyfit(x, y, length(x) - 1);
xxx = linspace(min(x), max(x));
yyy = polyval(a, xxx);
hold on;
scatter(x,y,'filled');
plot(xxx, yyy);

root_find = a; root_find(end) = root_find(end) - (1.7); 
root_find = roots(root_find); root_find = root_find(imag(root_find)==0);

plot(root_find, polyval(a, root_find), '*g');