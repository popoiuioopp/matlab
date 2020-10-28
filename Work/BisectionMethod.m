function result = BisectionMethod(f, n0, n1, desire_error)
    
    if n0 == n1
        fprintf("ERROR,\nBisection medthod shouldn't have x_lower = x_upper\n");
        result = NaN;
        return;
    end

    result = (n0 + n1)/2;
    error = 100;
    while error > desire_error
        previous = result;
        if f(n0) * f(result) < 0
            n1 = result;
        else
            n0 = result;
        end   
        result = (n0 + n1)/2;
        current = result;
        error = abs((current - previous)/current) * 100;
        %fprintf("Error = %f %%\n", error);
    end
end