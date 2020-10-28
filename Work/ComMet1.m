%{
PART I |  Determine the root of the following easily 
differentiable function,
         0.5x
        e      =   5  - 5x
            or
        e .^ (0.5 .* x) = 5 - 5 .* x
%}
clf;
%{
1.Create a Matlab script or function to solve the above 
equation by the graphical method, andestimate the roots.
            e .^ (0.5 .* x) = 5 - 5 .* x
%}
f = @(x) 5 - (5 .* x) - (exp(0.5 .* x)); % สร้าง Anonymous function และย้ายข้างให้ เป็น 0 = สมการ
x_zero = fzero(f, 1); % หาค่าที่ f(x) = 0 
 % เวลาวาดกราฟ กราฟจะไม่หายถ้าวาดทับ
subplot(2,2,1);
hold on;
title('Question 1 : Graphical Method')
grid on;
fplot(f); % plot กราฟของสมการ 
plot(linspace(-10,10,100), zeros(100));
xlim([-5, 5]);
plot(x_zero, f(x_zero), 'dr', 'MarkerFaceColor', 'r') % พล็อตจุดแดงในฟังก์ชั่น

%{
2. Create a Matlab function that implements the Bisection 
method according to Figure 5.11 inthe lecture note, and 
then write a Matlab script to solve the roots above. 
Perform iterations untilthe approximate error falls below 
2%, use the inital guess xl= 0and xu= 0
%}
xl = 0; xu = 1; error = 2;
x_result = BisectionMethod(f,xl,xu,error);

subplot(2,2,2);
hold on;
title('Question 2 : Bisection Method')
grid on;
fplot(f);
plot(x_result, f(x_result), "rd", 'MarkerFaceColor', 'r')

%{
3. Create a Matlab function that implements the 
Newton-Raphson method using the initialguess of 0.7, 
and then write a Matlab script to solve the roots above. 
Perform iterations until theapproximate error falls below 
2%.
%}
initial_guess = 0.7; error = 2;
x_result = NewtonRaphson(f, initial_guess, error);
subplot(2,2,3);
hold on;
title('Question 3 : Newton-Raphson Method')
fplot(f); 
grid on;
plot(x_result, f(x_result), "rd", 'MarkerFaceColor', 'r');

%{
4. Plot a graph of relative errors from 2 and 3 and discuss 
which method is better.
%}

n = 10; %NUMBER OF ITERATION

%{
Bisection method
%}
count = 0; x0 = 0; x1 = 1;
result = (x0 + x1)/2;
error_bisection = [];
while n > count
    count = count + 1;
    previous = result;
    if f(x0) * f(result) < 0
        x1 = result;
    else
        x0 = result;
    end
    result = (x0 + x1)/2;
    current = result;
    error_bisection = [error_bisection abs((current - previous)/current) * 100];
end

%{
Newton-Raphson
%}
count = 0; x0 = 1;
syms x;
fd = eval(['@(x)' vectorize(char(diff(f(x))))]);
format long;
x1 = fd(x0);
error_newton = [];
while n > count
    count = count + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/fd(x0));
    error_newton = [error_newton abs((x1-x0)/x1) * 100];
end

subplot(2,2,4);
title('Question 4 : Bisection vs. Newton-Raphson Method')
hold on;
grid on;
error_bisection(1) = 100; error_newton(1) = 100;
plot(linspace(1,100,n), error_bisection, linspace(1,100,n), error_newton)
ylim([0 inf]);
legend('Bisection','Newton-Raphson');
xlabel('Number of iteration(Times)');
ylabel('Relative Errors(%)');

