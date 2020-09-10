hold on;
x = linspace(1, 6, 100);
for j = 1 : 5
    plot(x, round(pi,(j^2)).^x);
end
hold off;