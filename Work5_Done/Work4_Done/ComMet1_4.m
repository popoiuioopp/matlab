iter = 20; 
f = @(x) 5-(5.*x)-(exp(0.5.*x));

l_bracket = 0; r_bracket = 1;
bisec_iter = iter;   
bisec_error = [];
h = 99;
while bisec_iter
    fl = f(l_bracket);
    fr = f(r_bracket);
    h0 = h;
    if fl * fr < 0
        h = ((r_bracket + l_bracket) / 2);
        fh = f(h);
        if fl * fh < 0
            r_bracket = h;
        elseif fr * fh < 0
            l_bracket = h;
        end
    else
        fprintf("Error: root not in brackets\n");
        return
    end
    bisec_iter = bisec_iter - 1;
    bisec_error = [bisec_error abs((h-h0)/h*100)];
end
bisec_error(1) = 100;

syms x;
g = matlabFunction(diff(f(x))); 
guess = 0.7;
newton_iter = iter;
newton_error = [];
while newton_iter
    guess0 = guess;
    guess = guess - (f(guess) ./ g(guess));
    result = f(guess);
    newton_iter = newton_iter - 1;
    newton_error = [newton_error abs((guess - guess0)/guess * 100)];
end
newton_error(1) = 100;

title('Bisection and Newton-Raphson') 
hold on; grid on;
plot(linspace(1, iter, iter), bisec_error, linspace(1, iter, iter), newton_error); 
legend('Bisection Method','Newton-Raphson Method');
xlabel('Number of iteration');
ylabel('Approximate Error');