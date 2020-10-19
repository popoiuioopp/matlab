function root = tim_bisection(f, l_bracket, r_bracket)
% Find roots using the bisection method. Requires two brackets.
%   Detailed explanation goes here
    tol = 0.0001;
    iter = 100;   
    while iter  
        fl = f(l_bracket);
        fr = f(r_bracket);
        if fl * fr < 0
            h = ((r_bracket + l_bracket) / 2);
            fh = f(h);
            fprintf("h=%+.5f l=%+.5f r=%+.5f f=%+.5f\n", h, l_bracket, r_bracket, f(h));
            if fl * fh < 0
                r_bracket = h;
            elseif fr * fh < 0
                l_bracket = h;
            end
        else
            fprintf("Error: root not in brackets");
            return
        end
        if abs(f(h)) < tol
            root = h;
            return
        end
        iter = iter - 1;
    end
    fprintf("Warn: Iteration limit exceeded.");
end