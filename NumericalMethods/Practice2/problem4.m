%{
Plot 1/((x-1)^2) between -10 and 10, but only display the ​y​-axis 
between 0 and 1.
%}
x = [-10 : 1 : 10]
y = 1./(x-1).^2
plot(x, y, "-ro")
ylim([0 1])