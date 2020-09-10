g = @(x) (x.^2).*(exp(-x)).*sin(pi.*x);
h = 0.5;
xroot = [];
for j = -2.5 : h : 2.5
    xroot = [xroot, fzero(g, j)];
end
xroot = unique(xroot);
hold on;
fplot(g, [-2.5, 2.5]);
ylim([-5, 5]);
grid on;
plot(xroot, 0, 'd');
hold off;