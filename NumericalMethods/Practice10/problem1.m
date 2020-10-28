%1 2 4 5 6

%{
1.Use Matlab’s integral function to evaluate the following integral.
%}
f = @(x) (1 - x - (4 .* x .^ 3) + (2 .* x .^5));
fprintf("Question 1 : integral = %f\n", integral(f,-2,4));

%{
2.Use Matlab’s trapz function to determine the distance travelled as 
recorded in thefollowing data table of velocity and time.
%}
t = [1 2 3.25 4.5 6 7 8 8.5 9 10];
v = [5 6 5.5  7   8.5 8 6 7 7  5];
fprintf("Question 2 : distance = %f meters\n", trapz(t,v));

%{
4.The total mass of a variable density rod is given by,
              ∫(from(0-L) ​ρ​(x) Ac(x) dx  
where ​m​ is mass, ​ρ​ is density, ​A​c​ is cross-sectional area, ​x​ is the 
distance alongthe rod, and ​L​ is the total length of the rod. The 
following data was taken from a 20m rod. Determine the mass in grams 
of the rod.
%}
x = [0 4 6 8 12 16 20];
l = [4.00 3.95 3.89 3.80 3.60 3.41 3.30];
Ac = [100 103 106 110 120 133 150];
y = l .* Ac;
%plot(x ,y);
fprintf("Question 4 : Rod = %f grams\n", trapz(x,y))

%{
5.Write a function file that implements the composite trapezium rule. 
The inputs should be the function to be integrated, a starting point, 
an end point, and anumber of segments.
%}
f = @(x) (1 - x - (4 .* x .^ 3) + (2 .* x .^5));
x = -2: 0.02: 4;
y = f(x);
result = problem5func(f, min(x), max(x), 301);
test = trapz(x,y);
fprintf("Question 5 : My Composite Trapezium = %f\n\t\t\t Build in Trapz = %f\n", result, test)

%{
6.Write a function file that implements the composite Simpson’s 1/3 rule. 
The inputsshould be the function to be integrated, a starting point, an 
end point, and anumber of segments. Your function should check that the 
user provided an evennumber of segments (consider what default behaviour 
you will do if there are anodd number of segments).
%}  
