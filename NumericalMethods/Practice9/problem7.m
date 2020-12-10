%{
7.Interpolate the following data using cubic splines with 
knot-a-not end condition andalso with clamped end condition 
with first derivatives set equal to 0. Plot bothcurves along 
with the data on the same graph. Use both interpolating 
methods toestimate the y-value when x = 1.5.
%}

x = [0 2 4 7 10 12];
y = [20 2 012 7 6 6];
xx = linspace(min(x), max(x));
yy = spline(x, y, xx);
plot(x, y, 'o', xx, yy);