%{
Use Newton’s interpolating polynomial to determine y at x = 3.5. 
Make a plot of thedata along with the polynomial.
%}

clf; clc; clear; format short;

x = [0 1 2.5 3 4.5 5 6];
y = [2 5.4375 7.3516 7.5625 8.4453 9.1875 12];

desire_x = 3.5;
desire_y = boss_new_inter(x, y, desire_x);

x_range = linspace(min(x), max(x));
[y_range, fd] = boss_new_inter(x,y, x_range);

hold on;
scatter(x,y);
plot(x_range, y_range);
plot(desire_x, desire_y, 'rd');