function result = BisectionMethod(f, n0, n1, desire_error)
    
    if n0 == n1
        fprintf("ERROR,\nBisection medthod shouldn't have x_lower = x_upper\n");
        result = NaN;
        return;
    end
    count = 0;
    result = (n0 + n1)/2;
    error = 100;
    while error > desire_error
        count = count + 1;
        previous = result;
        if f(n0) * f(result) < 0
            n1 = result;
        else
            n0 = result;
        end   
        result = (n0 + n1)/2;
        current = result;
        error = abs((current - previous)/current) * 100;
        fprintf("\nError = %f %% & Iteration = %d\nx1,x2 = %f,%f\n", error, count, n0, n1);
    end
    %fprintf("\nResult = %f\n", result);
    disp("----------------");
end