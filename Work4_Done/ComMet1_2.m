f = @(x) 5-(5.*x)-(exp(0.5.*x));

l_bracket = 0; r_bracket = 5;

error = 2;
iter = 100;   
h0 = 999;
while iter
    fl = f(l_bracket);
    fr = f(r_bracket);
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
        break
    end
    if abs((h - h0)/h * 100) < error
        root = h;
        break
    end
    iter = iter - 1;
    h0 = h;
end

fplot(f);
hold on;
grid on;
title('Bisection Method') 

plot(root, f(root), 'cd', 'MarkerSize', 15, 'MarkerFaceColor',[0.6350 0.0780 0.1840]);