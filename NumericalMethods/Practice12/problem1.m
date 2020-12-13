%{
1.Write a function file to obtain first derivative estimates 
for unequally spaced data.You may use any Matlab built-in 
functions. Test it with the following data:
%}

x = [0.6 1.5 1.6 2.5 3.5];
y = [0.9036 0.3734 0.3261 0.08422 0.01596];

res = prob1Func(x,y);

%{
2. Use the following data to find the velocity and acceleration 
at t = 10 seconds usingsecond order 
a) centred finite difference,
b) forward finite difference, and 
c)backward finite difference 
methods.
%}
t = [0 2 4 6 8 10 12 14 16];
x = [0 0.7 1.8 3.4 5.1 6.3 7.3 8.0 8.4];
h = 2; % step size
i = find(t == 10);

% Centred finite difference %
    % First derivative
    cd1 = ( x(i+1) - x(i-1) ) / (2*h); 
    cd1h = ( -x(i+2) + 8*x(i+1) - 8*x(i-1) + x(i-2) )  / (12*h);
    % Second derivative
    cd2 = ( x(i+1) - 2*x(i) + x(i-1) ) / (h^2);
    cd2h = ( -x(i+2) + 16*x(i+1) - 30*x(i) + 16*x(i-1) - x(i-2) ) / (12*h^2);
% Forward finite difference %
    % First derivative
    fd1 = ( x(i+1) - x(i) ) / h; % O(h)
    fd1h = ( -x(i+2) + 4*x(i+1) - 3*x(i) ) / (2*h); % O(h^2)
    % Second derivative
    fd2 = ( x(i+2) - 2*x(i+1) + x(i) ) / (h^2);
    fd2h = ( -x(i+3) + 4*x(i+2) - 5*x(i+1) + 2*x(i) ) / (h^2);
% Backward finite difference %
    % First derivative
    bd1 = ( x(i) - x(i-1) ) / h;
    bd1h = ( 3*x(i) - 4*x(i-1) + x(i-2) ) / (2*h);
    % Second derivative
    bd2 = ( x(i) - 2*x(i-1) + x(i-2) ) / (h^2);
    bd2h = ( 2*x(i) - 5*x(i-1) + 4*x(i-2) - x(i-3)) / (h^2);
    
%{
The following data were collected for the distance travelled versus 
time for arocket. Use finite difference approximations to estimate 
the rocket’s velocity ateach time using both standard and improved 
formulas.    
%}
t = [0 25 50 75 100 125];
y = [0 32 58 78  92 100];
h = 25;

c = 2 : length(t)-1;
ch = 3 : length(t) - 2;
f = 1;
fh = 1 : 2;
b = length(t);
bh = length(t)-1 : length(t);

fd1 = ( y(f+1) - y(f) ) / h; % O(h)
fd1h = ( -y(fh+2) + 4*y(fh+1) - 3*y(fh) ) / (2*h); % O(h^2)

cd1 = ( y(c+1) - y(c-1) ) / (2*h) ;
cd1h = ( -y(ch+2) + 8*y(ch+1) - 8*y(ch-1) + y(ch-2) )  / (12*h);

bd1 = ( y(b) - y(b-1) ) / h;
bd1h = ( 3*y(bh) - 4*y(bh-1) + y(bh-2) ) / (2*h);

standard = [fd1 cd1 bd1];
improved = [fd1h cd1h bd1h];

%{
4. Write a function file that calculates the second order 
centred finite differenceapproximation of an input function 
at a given  point (improved first derivative). Use aloop to 
decrease the step size until the relative iterative error
becomes smallenough (Use your discretion).
%}
t = [0 2 4 6 8 10 12 14 16];
x = [0 0.7 1.8 3.4 5.1 6.3 7.3 8.0 8.4];
h = 2;
error = 100;
res = [3];
while error > 0.1
   res = [res prob4Func(t,x,10,h)];
   h = h/2;
   error = abs(res(end) - res(end-1)) / res(end) * 100 ;
end

%{
5.The velocity (m/s) of an object at time t seconds is given 
by the following function.Using one level of Richardson’s 
extrapolation, find the acceleration of the particleat time 
t = 5 s initially using h = 0.5 and 0.25. Use the exact 
solution to compute the true percent relative error of each 
estimate.
                       v = (2*t) / sqrt(1+t^2);
%}
v = @(t) (2.*t)./ sqrt(1+t.^2);
h1 = 0.5; desire = 5;
x1 = [desire-h1 desire desire+h1];
h2 = 0.25; desire = 5;
x2 = [desire-h2 desire desire+h2];
% Using Centred differences
D_worse = (v(x1(end)) - v(x1(1))) / (2*h1);
D_better = (v(x2(end)) - v(x2(1))) / (2*h2);
D_improved = (4/3)*(D_better) - (1/3)*(D_worse);

% true value 
syms t;
v2 =  (2.*t)./ sqrt(1+t.^2);

v_syms = matlabFunction(diff(v2));

d_true = v_syms(desire);

err_worse = abs((d_true - D_worse) / d_true) * 100 ;
err_better = abs((d_true - D_better) / d_true) * 100;
err_improved = abs((d_true - D_improved) / d_true) * 100;

%{
6.Evaluate ∂f/∂x, ∂f/∂y and ∂​2​f/∂x​2​ for the following function 
at x = y = 1 numerically with Δx = Δy = 0.0001:
%}
f = @(x, y) 3.*x.*y + 3.*x - x.^3 - 3.*y.^3;
delta = 0.0001;
dfx = (f(1 + delta, 1) - f(1 - delta, 1)) / (2*delta);
dfy = (f(1, 1 + delta) - f(1, 1 - delta)) / (2*delta);
ddfx = (((f(1 + 2*delta, 1) - f(1, 1)) / (2*delta)) - ...
    ((f(1, 1) - f(1 - 2*delta, 1)) / (2*delta))) ...
    / (2*delta);
