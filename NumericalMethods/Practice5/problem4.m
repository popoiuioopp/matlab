h = 0.5;
root = [];
for j = 0 : h : 5
    root = [root, fzero(@prob4func, j)];
end
root = unique(root);
y = zeros(1, length(root))
hold on;
fplot(@prob4func, [0 5]);
plot(root, y, 'd');
grid on;
hold off;