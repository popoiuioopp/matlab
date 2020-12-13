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

n = length(x);

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
6.Use multiple linear regression to fit the following 
data. Also calculate the standarderror and correlation 
coefficient.
%}
 x1 = [0 1 1 2 2 3 3 4 4];
 x2 = [0 1 2 1 2 1 2 1 2];
 y  = [15.1 17.9 12.7 25.6 20.5 35.1 29.7 45.4 40.2];
 
 M = [ length(x1) sum(x1) sum(x2); 
    sum(x1) sum(x1.^2) sum(x1.*x2); 
    sum(x2) sum(x1.*x2) sum(x2.^2) ];

b = [ sum(y) sum(x1.*y) sum(x2.*y) ]';

a = M\b;

xx1 = linspace(min(x1),max(x1));
xx2 = linspace(min(x2),max(x2));
yy = a(1) + a(2).*xx1 + a(3).*xx2;
%plot(x1,y,'or',x2,y,'og',xx1,yy,xx2,yy);

St = sum( (y - mean(y) ).^2 );
Sr = sum( (y - (a(1)+a(2).*x1+a(3).*x2)).^2);
r = sqrt( (St-Sr)/St ) ;

Syx = sqrt(Sr/(length(x1) - (2+1)));


%{
8.Three disease-carrying organisms decay exponentially in 
seawater according tothe following model equation. Use 
general least squares to estimate thecoefficients and 
estimate the initial concentration of each organism from 
the following measurements.
%}
t = [0.5 1 2 3 4 5 6 7 9];
y = [6 4.4 3.2 2.7 2 1.9 1.7 1.4 1.1];

Z = [ exp(t.*-1.5); exp(t.*-0.3);exp(-0.05.*t)]';

a = (Z'*Z)\(Z'*y') ;

f = @(t) a(1).*exp(-1.5.*t) + a(2).*exp(-0.3.*t) + a(3).*exp(-0.05.*t);

xx = linspace(min(t),max(t));
plot(t,y,'or');
hold on
plot(xx,f(xx));

St = sum( (y - mean(y)).^2 );
Sr = sum( (y - f(t)).^2 );
r = sqrt( (St - Sr)/ St );
Syx = sqrt( Sr / (length(t) - (3+1)) );