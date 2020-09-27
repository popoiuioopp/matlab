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
T = [-40, 0, 40, 80, 120, 160] + 273.154;
p = [6900, 8100, 9350, 10500, 11700, 12800];

plot(T,p,'xr-');
hold on;
temp = polyfit(T,p,1);
a1 = temp(1); a0 = temp(2);
fplot(@(x) a1 .* x + a0, [min(T) max(T)]);
hold off;
    %{
    After we plotted a graph we can see that the lines are 99.98% perfect
    so we can assume that they are the same equation.
    [a1x + a0 = y] == [pV = nRT]
    and we can see that p = y, T = x
    [a1x + a0 = y] == [yV = nRx]
    [a1x + a0 = y] == [y = (nRx)/V]
    [a1x + a0 = y] == [y = (nR/V) * x]
    and we can see that (a1x) is the same form as ((nR/V) * x)
    that means a1 = nR/V
    R = (a1*V)/n
    %}
V = 10; n = (1000/14.006747)*2; %Nitrogen = 2element
R = (a1*V)/n;

%{
5.Linearise the following model and use it to estimate the parameters 
α​4​ and β​4​ forthe following data. Plot the data with the line of best 
fit and calculate the correlationcoefficient.
                y = (α​4​) .* x .* exp(β​4​) .* 4 .^ x)
%}
x = [1 2 4 6 9 13 15 17 18] * 1e-1;
y = [75 125 145 125 85 55 35 28 18] * 1e-2;
