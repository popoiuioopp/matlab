%Question 5.13 in text book.
g = 9.8;
c = 15;
V = 35;
t = 9;
f = @(m) ((g.*m)./c).*(1-exp(-(c./m).*t)) - V;
fplot(f);
hold on;
grid on;

syms m;
g = matlabFunction(diff(f(m))); 
guess = 10;
error = 0.1;
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

plot(root, f(root), 'cd', 'MarkerSize', 15, 'MarkerFaceColor',[0.6350 0.0780 0.1840]);

