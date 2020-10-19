%{
IMPORTANT PROBLEMS : 1 2 6 8 9 10 11 12 13 14 15
%} 

%{
1.Fit a cubic polynomial to the following data by extending 
the system of equationson lecture slide 3, then calculate the 
standard error and correlation coefficient.Graph the data and 
your fitting equatio
%}

x = [3 4 5 7 8 9 11 12];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

hold on;
scatter(x,y,'filled')
x1 = sum(x);
x2 = sum(x.^2);
x3 = sum(x.^3);
x4 = sum(x.^4);
x5 = sum(x.^5);
x6 = sum(x.^6);
y1 = sum(y);
xy = sum(x.*y);
x2y = sum((x.^2) .* y);
x3y = sum((x.^3) .* y);

n = max(size(x));

M = [n , x1, x2, x3; 
     x1, x2, x3, x4;
     x2, x3, x4, x5;
     x3, x4, x5, x6];
b = [y1; xy; x2y; x3y];
 
a = M\b;
a = flip(a)';
plot(linspace(min(x), max(x)) ,polyval(a, linspace(min(x), max(x))))
m = 3; 
Sr = sum((y - (a(4) + a(3).*x + a(2).*(x.^2) + a(1).*(x.^3))).^2);
%OR Sr = sum((y - polyval(a, x)).^2);
St = sum((y - mean(y)).^2);
Se = sqrt(Sr/(n - (m + 1)));
r2 = (St - Sr)/St;

%{
2.Do the same as in the Question 1 but using the 
general Z-matrix formulation given on slides 21-25. 
You should get the same result if you have done it 
correctly.    
%}
x = [3 4 5 7 8 9 11 12]';
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]';
Z = [ones(size(x)) x x.^2 x.^3];
a = flip((Z' * Z)\(Z' * y))';

n = max(size(x));
m = 3; 
Sr = sum((y - (a(4) + a(3).*x + a(2).*(x.^2) + a(1).*(x.^3))).^2);
St = sum((y - mean(y)).^2);
Se = sqrt(Sr/(n - (m + 1)));
r2 = (St - Sr)/St;

%{
3.Calculate the correlation coefficients for the 2 power 
equation models from Example 6 in the lecture notes and 
decide if one equation is better than the other or not.
%}
x = [10 20 30 40 50 60 70 80];
y = [25 70 380 550 610 1220 830 1450];
