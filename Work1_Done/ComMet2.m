%{
5.17  You are designing a spherical tank (Fig. P5.17) to hold water 
for a small village in a developing country. The volume of liquid 
it can hold can be computed as
                               2
                       V = pi h [3R - h]
                                    3
where V = volume (m^3), h = depth of water in tank (m), and R = the 
tank radius (m).
If R=3 m, to what depth must the tank be filled so that it holds 30 m^3? 
Use three iterations of the false-position method to determine your 
answer. Determine the approximate relative error after each iteration. 
Employ initial guesses of 0 and R.
%}
clf;
V = 30; R = 3;
f = @(x) (pi .* (x .^ (2)) .* (3 .* R - x) ./ 3) - V;

subplot(2,1,1);
hold on;
title('Question 15.17 : Spherical Tank using Newton-Raphson')
fplot(f);
grid on;
%{
According to the graph, there are 2 roots which is around x = -1.5,
x = 2 and x = 8
Using Newton-Raphson method
%}
initial_guess1 = -1.5; initial_guess2 = 2; initial_guess3 = 8; error = 0.001; 
x_result1 = NewtonRaphson(f, initial_guess1, error);
x_result2 = NewtonRaphson(f, initial_guess2, error);
x_result3 = NewtonRaphson(f, initial_guess3, error);
plot(x_result1, f(x_result1), 'bd', 'MarkerFaceColor', 'r')
plot(x_result2, f(x_result2), 'bd', 'MarkerFaceColor', 'r')
plot(x_result3, f(x_result3), 'bd', 'MarkerFaceColor', 'r')
ylabel('Volume(m^3)');
xlabel('Depth(m)');
%xlim([0,6]);
answer = [x_result1, x_result2, x_result3];
fprintf("The answer = %f, %f, %f\n", answer(1), answer(2), answer(3))

subplot(2,1,2);
hold on;
title('Question 15.17 : Spherical Tank using Bisection Method')
fplot(f);
grid on;
%{
According to the graph, there are 3 roots which is around x = -2,
x = 2 and x = 8
Using Bisection method
%}
initial_guess1 = -2; initial_guess2 = 2; initial_guess3 = 8; error = 0.001;
x_result1 = BisectionMethod(f, initial_guess1, initial_guess1 + 1, error);
x_result2 = BisectionMethod(f, initial_guess2, initial_guess2 + 1, error);
x_result3 = BisectionMethod(f, initial_guess3, initial_guess3 + 1, error);

plot(x_result1, f(x_result1), 'bd', 'MarkerFaceColor', 'r')
plot(x_result2, f(x_result2), 'bd', 'MarkerFaceColor', 'r')
plot(x_result3, f(x_result3), 'bd', 'MarkerFaceColor', 'r')
ylabel('Volume(m^3)');
xlabel('Depth(m)');
%xlim([0,6]);
answer = [x_result1, x_result2, x_result3];
fprintf("The answer = %f, %f, %f\n", answer(1), answer(2), answer(3))
