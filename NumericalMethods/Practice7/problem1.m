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
OR
St = sum((y - mean(y)).^ 2)   --------  Sr = sum((y - a0 - a1 .* x).^ 2)
                     r^2 = (St - Sr)/St
%}

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
                y = α​4​ .* x .* exp(β​4​).^ x
%}
x = [1 2 4 6 9 13 15 17 18] * 1e-1;
y = [75 125 145 125 85 55 35 28 18] * 1e-2;
hold on;
scatter(x, y);
%log(y/x) = log(α​4) + β​4​ * x
yfit = log(y ./ x); % new y = log(y/x)
temp = polyfit(x, yfit, 1); %find polyfit for new linear methods
beta4 = temp(1); alpha4 = exp(temp(2)); %beta not effect anything because β​4​ * x
%But alpha in the log() so we need to take α​4 out first.
yplot = (alpha4) .* x .* exp(beta4) .^ (x); %substitute to the first equation
plot(x, yplot);
hold off;
%{
Find corrcoef
St = sum((ylin - mean(ylin)).^ 2)----Sr = sum((liny - a0 - a1 .* xlin).^ 2)
                     r^2 = (St - Sr)/St
%}
St = sum((yfit - mean(yfit)).^ 2);
Sr = sum((yfit - temp(2) - temp(1) .* x).^ 2);
r = sqrt((St - Sr)/St);

%{
6.Try fitting a power equation to the following data on metabolisms 
of animals thenusing it to predict the metabolism rate of a 200kg tiger.
%}
%kg = [0.16 0.3 2 45 70 400]; watts = [0.97 1.45 4.8 50 82 270];
kg = [400 70 45 2 0.3 0.16]; watts = [270 82 50 4.8 1.45 0.97];
hold on;
scatter(kg, watts);
% power equation non linear : y = alpha * x ^ beta
% power equation : log10(y) = log10(alpha) + beta * log10(x);
% ^^^^^ that is the linear form. and we need to put it in the polyfit.
%to put it in, we need to change form of x and y to log(x) and log(y)
temp = polyfit(log(kg), log(watts), 1);
%log(alpha) = A0 (But we want alpha) --> alpha = exp(A0)
alpha = exp(temp(2));
%beta = A1 ez
beta = temp(1);
%Then we plot using the non linear equation of power equation.
x = linspace(0,500);
y = alpha .* (x .^ beta);
plot(x, y);
hold off;

%{
7.The following data represents bacteria growth. Two models have 
been proposedfor this growth:

k = (km*c)/(cs+c)            k = (km*c^2)/(cs+c^2)

Where k is the growth rate and c is the concentration. Fit the data 
below to both ofthese models by transforming them into linear 
relationships and finding theparameters ​k​m​ and ​c​s​. Which model fits 
the data better? Predict the growth of bacteria when c = 2 mg/L.
%}

%{
a1 = cs/km |||| a0 = 1/km
cs = a1*km |||| km = 1/a0
%}
%------------------- 1st system
c = [0.5 0.8 1.5 2.5 4]; 
k = [1.1 2.5 5.3 7.6 8.9];
scatter(c,k);
xlin = 1 ./ c;
ylin = 1 ./ k ;
temp = polyfit(xlin, ylin, 1);
hold on;
km = 1 / temp(2);
cs = temp(1) * km;
%k = (km*c)/(cs+c);
x = linspace(0,4);
y = (km .* x) ./ (cs + x);
plot(x, y);
hold off;

%------------------- 2nd system
c = [0.5 0.8 1.5 2.5 4]; 
k = [1.1 2.5 5.3 7.6 8.9];
scatter(c,k);
xlin = 1./(c.^2);
ylin = 1 ./ k ;
temp = polyfit(xlin, ylin, 1);
hold on;
km = 1 / temp(2);
cs = temp(1) * km;
%k = (km*c)/(cs+c);
x = linspace(0,4);
y = (km .* x.^2) ./ (cs + x.^2);
plot(x, y);
%vvvv Plot at point where c = 2
c = 2; y = (km .* c.^2) ./ (cs + c.^2);
plot(c, y, 'rd');
%^^^^ ------------------------
hold off;
%{
Find corrcoef
St = sum((ylin - mean(ylin)).^ 2)----Sr = sum(liny - a0 - a1 .* xlin).^ 2)
                     r^2 = (St - Sr)/St
%}


%{
8.A transportation engineering study was conducted to 
determine the proper designof bike lanes. Data were 
gathered on bike lane widths and average distance between 
bikes and passing cars. The data from 9 streets are:
%}
distance = [2.4 1.5 2.4 1.8 1.8 2.9 1.2 3 1.2];
lanewidth = [2.9 2.1 2.3 2.1 1.8 2.7 1.5 2.9 1.5];
%{
(a) Plot the data.
%}
hold on;
scatter(distance, lanewidth);

%{
(b) Fit a straight line to the data with linear regression. 
Add this line to the plot.
%}
temp = polyfit(distance, lanewidth, 1);
a1 = temp(1); a0 = temp(2);
fplot(@(x) a1 .* x + a0, [min(distance) max(distance)])

%{
(c) If the minimum safe average distance between bikes 
and passing cars is considered to be 1.8m, determine the 
corresponding minimum lane width.
%}
x = 1.8; y = a1 .* x + a0;
plot(x, y, 'dr')


%{
9.The table below shows the 2015 world record times and holders 
for outdoorrunning. ​Fitapowermodel​for each gender and use it to 
predict the record timefor a half marathon (21,097.5m). Note: 
the actual records for the half marathon are3503s (Tadese) and 
3909s (Kiplagat) for men and women, respectively.
%}

%LINEAR VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
event = [100 200 400 800 1000 1500 2000 5000 10000 20000 42195];
timem = [9.58 19.19 43.18 100.90 131.96 206.00 284.79 757.40 1577.53 3386.00 7377.00];
timef = [10.49 21.34 47.60 113.28 148.98 230.07 325.35 851.15 1771.78 3926.60 8125.00];

hold on;
scatter(event, timem, 'bd')
scatter(event, timef, 'ro')

tempmale = polyfit(event, timem, 1);
am1 = tempmale(1); am0 = tempmale(2);
tempfemale = polyfit(event, timef, 1);
af1 = tempfemale(1); af0 = tempfemale(2);
fplot(@(x) am1 .* x + am0, [min(event) max(event)])
fplot(@(x) af1 .* x + af0, [min(event) max(event)])
hold off;

%POWER VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
event = [100 200 400 800 1000 1500 2000 5000 10000 20000 42195];
timem = [9.58 19.19 43.18 100.90 131.96 206.00 284.79 757.40 1577.53 3386.00 7377.00];
timef = [10.49 21.34 47.60 113.28 148.98 230.07 325.35 851.15 1771.78 3926.60 8125.00];
hold on;
scatter(event, timem, 'bd')
scatter(event, timef, 'ro')

eventlin = log(event); timemlin = log(timem); timeflin = log(timef);
tempmale = polyfit(eventlin, timemlin, 1);
am1 = tempmale(1); am0 = tempmale(2);
tempfemale = polyfit(eventlin, timeflin, 1);
af1 = tempfemale(1); af0 = tempfemale(2);

alpham = exp(am0); alphaf = exp(af0);
betam = am1; betaf = af1;
x = linspace(min(event),max(event));
ym = alpham .* (x .^ betam);
yf = alphaf .* (x .^ betaf);
plot(x, ym);
plot(x, yf);
plot(21097.5,  alpham .* (21097.5 .^ betam), 'ks', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'b');
plot(21097.5,  alphaf .* (21097.5 .^ betaf), 'ks', 'MarkerSize', 10, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'r');
hold off;
