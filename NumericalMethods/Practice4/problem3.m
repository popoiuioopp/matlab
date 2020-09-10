x = linspace((-2)*pi, 2*pi);
hold on;
for j = 1 : 4
    y = prob3cosx(x, 2^j);
    plot(x,y);
end
hold off;