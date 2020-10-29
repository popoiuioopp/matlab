function answer = BisectionMethod(f, x0, x1, error)
    if f(x0)*f(x1) > 0
        fprintf('\nError, please change the data point\n');
        return;
    end
    iteration = 0;
    answer = (x0 + x1)/2;
    previous = x0;
    current = x1;
    while abs((current - previous)/current) * 100 > error
        iteration = iteration + 1;
        previous = answer;
        if f(x0) * f(answer) < 0
            x1 = answer;
        elseif f(x1) * f(answer) < 0
            x0 = answer;
        end   
        answer = (x0 + x1)/2;
        current = answer;
    end
end