%{
1. Write a script file that solves the following ODE using 
Euler’s method from t = 0 to 3with a step size of h = 0.5 
where y(0) = 1. Plot the results.
            dy             2
            dt  =   - y + t
%}
clear;clc;clf;
f = @(y,t) -y + t^2;
y(1) = 1;
step = 0.5;
ending = 3;
start = 0;
while start < ending
 y = [y y(end)+f(y(end), start)*step];
 start = start + step;
end
hold on;
plot(linspace(0, 3,length(y)), y);
plot(3, y(end), 'or');

%{
2. Repeat Question 1 using Heun’s method without iteration.
%}
clear;clc;clf;
f = @(y,t) -y + t^2;
y(1) = 1;
step = 0.5;
ending = 3;
start = 0;
while start < ending
 y = [y y(end)+(f(y(end), start)+f(start+step, y(end)+f(y(end), start)*step))*step];
 start = start + step;
end
hold on;
plot(linspace(0, 3,length(y)), y);
plot(3, y(end), 'or');