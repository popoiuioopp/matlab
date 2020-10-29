%Question 1 
f = @(x) 5-(5.*x)-(exp(0.5.*x));
figure('Name', 'Question 1');
hold on;
title('Question 1') 
x = linspace(-10, 10, 100); 
plot(x, f(x),'g-'); % Plot the graph from -10 to 10
plot(linspace(-10,10,100), zeros(100), '--'); % Plot the zero line
root = 0.707071; %From the graph, we can see that root is around 0.707071
plot(root, f(root), 'ro'); %Plot the point

%Question 2 
%root = BisectionMethod(f,0,0,2); %NOT WORKING.
root = BisectionMethod(f,-1,1,2); %Change the points then it works
figure('Name', 'Question 2');
hold on;
title('Question 2')
x = linspace(-10, 10, 100);
plot(x, f(x),'g-'); % Plot the graph from -10 to 10
plot(linspace(-10,10,100), zeros(100), '--'); % Plot the zero line
plot(root, f(root), 'ro') %Plot the point

%Question 3 
root = NewtonRaphson(f, 0.7, 2); 
figure('Name', 'Question 3');
hold on;
title('Question 3')
x = linspace(-10, 10, 100);
plot(x, f(x),'g-'); % Plot the graph from -10 to 10
plot(linspace(-10,10,100), zeros(100), '--'); % Plot the zero line
plot(root, f(root), 'ro'); %Plot the point


%Question 4 
% Bisection method
n = 20; %Number of iteration
iteration = 0; %Count the iteration
xl = -1; %First point
xu = 1; %Second point
midpoint = (xl + xu)/2; %Calculate the mid point
error_bisection = []; %Create empty vector
while iteration < n %Run for n times.
    iteration = iteration + 1;
    previous = midpoint; 
    if f(xl) * f(midpoint) < 0
        xu = midpoint;
    elseif f(xu) * f(midpoint) < 0
        xl = midpoint;
    end
    midpoint = (xl + xu)/2;
    current = midpoint;
    error_bisection(iteration) = abs((current - previous)/current); % Add the error value to vector.
end

%Newton-Raphson
n = 20; %Number of iteration
iteration = 0; %Count the iteration
x0 = 1; %Initial guess
syms x; %Symbolic toolbox
f1 = matlabFunction(diff(f(x))); %Get differentiated function
x1 = f1(x0); %Get the x1 value
error_newton = []; %Create empty vector
while iteration < n
    iteration = iteration + 1;
    x0 = x1;
    x1 = x0 - (f(x0)/f1(x0));
    error_newton(iteration) = abs((x1-x0)/x1); % Add the error value to vector.
end

%Ploting the graph, iteration against error.
figure('Name', 'Question 4');
title('Question 4')
hold on;
error_bisection(1) = []; 
error_newton(1) = [];
plot(linspace(1,n-1,n-1), error_bisection,'g-');
plot(linspace(1,n-1,n-1), error_newton,'c-');
legend('Bisection','Newton-Raphson');
xlabel('Iteration');
ylabel('Relative Errors');