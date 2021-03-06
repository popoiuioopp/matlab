%{
1. Write a script file that solves the following ODE using 
Euler’s method from t = 0 to 3 with a step size of h = 0.5 
where y(0) = 1. Plot the results.
            dy             2
            dt  =   - y + t
%}
clear;clc;clf;
f = @(t, y) -y + t^2;
y(1) = 1;
step = 0.5;
ending = 3;
start = 0;
while start < ending
 y = [y y(end)+f(start, y(end))*step];
 start = start + step;
end
hold on;
plot(linspace(0, 3,length(y)), y);
plot(3, y(end), 'or');

%{
2. Repeat Question 1 using Heun’s method without iteration.
%}
clear;clc;clf;
f = @(t, y) -y + t^2;
y(1) = 1;
step = 0.5;
t = 0:step:3;
for i = 1:length(t)-1
    y0(i) = y(i) + f(t(i), y(i))*step;
    y(i+1) = y(i) + ( f(t(i), y(i)) +  f (t(i+1),y0(i)))*step/2;
end
hold on;
plot(linspace(0, 3,length(y)), y);
plot(3, y(end), 'or');

%{
3.Repeat Question 1 using Heun’s method with iteration until 
the approximate error isless than 0.1%.
%}
clear;clc;clf;
f = @(t, y) -y + t^2;
start = 0;
step = 0.5;
final = 3;
init = 1;
tol = 0.1;
y = HeunIterativeMethod(f,start,final,init,step,tol);
hold on;
plot(linspace(0,3, length(y)), y);
plot(3, y(end), 'or');

%{
4.Repeat Question 1 using 4th order RK.
%}
clear;clc;clf;
f = @(t, y) -y + t^2;
y(1) = 1;
step = 0.5;
ending = 3;
start = 0;
while start < ending
    k1 = f(start, y(end));
    k2 = f(start + (1/2)*step, y(end) + ((1/2)*k1*step));
    k3 = f(start + (1/2)*step, y(end) + ((1/2)*k2*step));
    k4 = f(start + step, y(end) + (k3*step));
    y(end+1) = y(end) + ((1/6)*(k1 + 2*k2 + 2*k3 + k4)*step);
    start = start + step;
end
hold on;
plot(linspace(0,3, length(y)), y);
plot(3, y(end), 'or');

%{
5.Use the scripts you created in Questions 2-4 to write function 
files that solve a 1st order ODE using each method. The inputs to 
the functions should be the 1stderivative function, f(t,y), the 
end time, an initial point, and the step size for allmethods 
except the Heun method with iteration. For the Heun method with 
iterationreplace the step size input with the required tolerance. 
Test your functions with theODE from question 1.
%}
