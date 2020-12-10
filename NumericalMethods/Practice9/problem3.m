%{
Use a Lagrange interpolating polynomial to determine y at x = 4. 
Make a plot of the data along with the polynomial.
%}

x = [1 2 3 5 6];
y = [4.75 4 5.25 19.75 36];
hold on;
plot(linspace(min(x), max(x)), lagrange(x,y,linspace(min(x), max(x))));
plot(4, lagrange(x,y,4), 'r*');