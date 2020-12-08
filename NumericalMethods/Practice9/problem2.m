%{
Use Newton’s interpolating polynomial to determine y at x = 3.5. 
Make a plot of thedata along with the polynomial.
%}

clf; clc; clear; format long;

x = [0 1 2.5 3 4.5 5 6];
y = [2 5.4375 7.3516 7.5625 8.4453 9.1875 12];

x = [1 4 6 5];
y = [0 1.386294 1.791759 1.609438];

n = length(x);table = zeros(n, n+1); table(:,1) = x;  table(:,2) = y; 

for j = 1: n-1
    for k = 1: n-j
       table(k, j+2) = (table(k+1, j+1) - table(k, j+1)) ...
           / (table(j + k, 1) - table(k, 1));
    end
end

all_x = linspace(min(x), max(x));
this_x_pos = zeros(1, 100);
for a = 1 : length(all_x)
    this_x = all_x(a); 
    temp = ones(1, n-1);
    for j = 1: n-1
        for k = 1: j
            temp(j) = temp(j) *  (this_x - x(k));
        end
    end
    this_x_pos(a) = sum(table(1,3:end) .* temp);
end

desire_x = 3.5;

temp = ones(1, n-1);
for j = 1: n-1
    for k = 1: j
        temp(j) = temp(j) *  (desire_x - x(k));
    end
end
desire_y = sum(table(1,3:end) .* temp);

hold on;
plot(all_x, this_x_pos);
plot(desire_x, desire_y, 'rd');