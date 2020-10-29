f = @(x) 5-(5.*x)-(exp(0.5.*x));
syms x;
g = matlabFunction(diff(f(x))); 
guess = 0.7;
error = 2;
iter = 100;
guess0 = 999;
while iter
    guess = guess - (f(guess) ./ g(guess));
    result = f(guess);
    iter = iter - 1;
    
    if abs((guess - guess0)/guess * 100) < error
        root = guess;
        break
    elseif result == 0
        root = guess;
        break
    end
    guess0 = guess;
end


hold on;
grid on;
fplot(f);
 %Plot the point
plot(root, f(root), 'cd', 'MarkerSize', 15, 'MarkerFaceColor',[0.6350 0.0780 0.1840]);