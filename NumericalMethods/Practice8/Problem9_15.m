%{
Use nonlinear regression to estimate α4 and β4 based 
on the following data.Develop a plot of your fit 
along with the data.
%}
x = [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

A = fminsearch(@fit_power,[1,1],[],x,y);
f = @(x) A(1) .* x .* exp(A(2).*x);
hold on;
scatter(x,y);
plot(linspace(min(x), max(x)), f(linspace(min(x), max(x))));

%{
10.Use Matlab’s symbolic toolbox to factorise the 
following polynomial:
%}
syms x;
f = x.^3 + 3.*x.^2 - x - 3;
factor(f);

%{
11.Use Matlab’s symbolic toolbox to find the 3rd 
order Taylor series expansion of thefollowing 
function about the point x = –1.
%}
syms x;
f = exp(-3*x.^2) * sin(x.^7 - 5*x.^5);
taylor(f,x,-1);

%{
12.Use Matlab’s symbolic toolbox to solve the 
following system of equations for thevariables 
x and y.
%}
syms x y;
f1 = 3*x - y == 12;
f2 = x + 3*y == -7;
a = solve([f1,f2],[x,y]);
x = a.x;
y = a.y;

%{
13.Use Matlab’s symbolic toolbox to differentiate 
the following function.
%}
syms x;
f = (x.^2 .* cos(2.*x.^3)) / ((x.^2 - 1).^2 - sin(x)) ;
diff(f);

%{
14.Use Matlab’s symbolic toolbox to solve the 
following indefinite integral.
%}
syms x;
dg =  (-5.*x.^2).*(sin(2.*x.^3).^3).*cos(2.*x.^3);
G = int(dg);

%{
15.Convert the antiderivative you found in 
Question 14 into a Matlab Function and use
it to evaluate (using the Fundamental 
Theorem of Calculus):
%}
syms x;

p = sym(pi);
piVpa = vpa(p);

dg =  (-5.*x.^2).*(sin(2.*x.^3)).*cos(2.*x.^3);

G = int(dg);

int_value = subs(G,x,piVpa/4) - subs(G,x,-piVpa/3);
