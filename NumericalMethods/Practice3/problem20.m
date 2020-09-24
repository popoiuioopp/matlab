%{
20.Write a script that creates 2 anonymous functions, f1 
and f2, for sin(​x​) and cos(​x​), then a 3​rd anonymous 
function, f3, equal to the first function divided by 
the second function (f1/f2 =sin(​x​)/cos(​x​) = tan(​x​)). 
The script should then plot all 3 functions in different 
colours usingsubplots over the domain -2π < ​x​ < 2π. Set 
the axes on the graph to have ​y​-limits between -1 and 1. 
Don’t forget to label the axes.
%}
f1 = @(x) sin(x);
f2 = @(x) cos(x);
f3 = @(x, f1, f2) f1(x)./f2(x);
hold on;
x = linspace(-2*pi, 2*pi, 100);
subplot(4, 1, 1)
plot(x, f1(x))
title('sin(x)')
ylim([-1, 1])
ylabel('sin(x)')

subplot(4, 1, 2)
plot(x, f2(x))
title('cos(x)')
ylim([-1, 1])
ylabel('cos(x)')

subplot(4, 1, 3)
plot(x, f3(x, f1, f2))
title('tan(x)')
ylim([-1, 1])
ylabel('tan(x)')
hold off;
%{
21.Create an anonymous function, 
f4, that takes 2 inputs, ​x​ and ​y​, then calculates ​x​y​.
%}
f4 = @(x, y) x.^y;
f4(2,3)

%{
22.Create an anonymous function, f5, that takes 3 inputs, 
​f​, ​a​ and ​b​, where ​f​ is another anonymous function, and 
plots f​ between ​a​ and ​b​. Test f5 by using f1, f2 or f3 
over what ever domain you like.
%}
f5 = @(f, a, b) fplot(f,[a b]);
subplot(4, 1, 4);
f5(f2, -2*pi, 2*pi);

%{
23.Create a function file (​not anonymous​) that takes 3 inputs 
and produces a surface plot. Thefirst input should be a function 
that accepts 2 arguments (x and y), the second and third inputs
should be vectors containing the desired values of x and y over 
which to plot. Test yourfunction using the function f4 from 
question 21 with x-values from 0 to 1 and y-values from 0to 4.
%}

%{
24.Write a function file that takes between 3 and 6 input arguments 
(all scalar values) and returnsa vector containing all the inputs 
sorted from lowest to highest. Warning messages should bedisplayed 
in the command window if the user enters the wrong nu                                                                                                                 mber of inputs, 
or avector/string instead of a scalar.
%}

%{
26.Write a function file that accepts any number of vector inputs 
of the same length and plotseach of them in different colours against 
the first vector on the same axes. Your code shouldcheck each of the 
vectors is the same length or display a warning to the user.
%}  

%{
27.Write a function file that accepts 3 input arguments, ​a​, ​b​ and ​c​. 
If they are all different return 3output arguments equal to the input .
values. If 2 are the same but 1 is different then return onlythe 2 unique 
values. If all 3 are the same then return the unique value as a single 
outputargument. Make sure to check the user asks for the right number of 
outputs.
%}

%{
28.Writea function file that takes one input and creates a random square 
matrix of integers ofthat size. The outputs of the function should be the 
mean of each column of the matrix. Makesure to check the required number 
of outputs is requested by the user.
%}