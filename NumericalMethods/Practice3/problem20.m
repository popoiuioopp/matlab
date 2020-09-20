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
23.Create an anonymous function, f6, that does the same 
thing as Q22 but works with the anonymous function, f4, 
which requires 2 inputs.
%}