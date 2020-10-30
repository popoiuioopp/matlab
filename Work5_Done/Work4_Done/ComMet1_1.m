title('Graphical Method') 
f = @(x) 5-(5.*x)-(exp(0.5.*x));
grid on;
hold on;
fplot(f);
hline = refline(0, 0);
hline.Color = 'k';

% 0.7197 come from the graph.
plot(0.7197, f(0.7197), 'cd', 'MarkerSize', 15, 'MarkerFaceColor',[0.6350 0.0780 0.1840]);
