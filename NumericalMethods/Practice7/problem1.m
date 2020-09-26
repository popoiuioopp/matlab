%{
1.Use least squares regression to fit a straight line to the 
following data (implementthe formula from the lectures in Matlab).
%}
x = [0 2 4 6 9 11 12 15 17 19]; 
y = [5 6 7 6 9 8  8  10 12 12];
hold on;
scatter(x, y);

a1 = ((length(x) * sum(x .* y) - sum(x) * sum(y))) / ((length(x) * sum(x .^ 2)) - (sum(x) ^ 2));
a0 = mean(y) - a1 * mean(x);

fplot(@(x) a1 .* x + a0, [min(x) max(x)])


%{
2.Calculate the correlation coefficient for the best fit line 
from question 1.
%}
xy = x .* y;
x2 = x .^ 2;
y2 = y .^ 2;
n = length(x);
r = (n * sum(xy) - sum(x) * sum(y))/(sqrt(n * sum(x2) - sum(x) ^ 2) * ... 
    sqrt(n * sum(y2) - sum(y) ^ 2));
%OR
r = (corrcoef(x,y)) ; r = r(2,1);

%{
3.Repeat question 1 but use the Matlab built-in functions polyfit 
to find the equationand polyval to plot.
%}
x = [0 2 4 6 9 11 12 15 17 19]; 
y = [5 6 7 6 9 8  8  10 12 12];
temp = polyfit(x, y, 1);
a1 = temp(1); a0 = temp(2);
fplot(@(x) a1 .* x + a0, [min(x) max(x)]);
hold off;
clf;
%{
4.The following data were gathered to determine the relationship 
between pressureand temperature of a fixed volume of 1 kg of nitrogen 
(molar mass of 14.006747g/mol). The volume is 10m​3​. Use the ideal gas 
law equation to determine theuniversal gas constant, R
%}
T = [-40, 0, 40, 80, 120, 160];
p = [6900, 8100, 9350, 10500, 11700, 12800];
scatter(T, p);
hold on;
temp = polyfit(T,p,1);
a1 = temp(1); a0 = temp(2);
fplot(@(x) a1 .* x + a0, [min(T) max(T)]);
hold off;
