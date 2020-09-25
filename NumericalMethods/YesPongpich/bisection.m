function result = bisection(f, left, right)
    tol = 0.00001;
    result = (left + right)/2;
    while (abs(f(result))) > tol
        if f(left) * f(result) < 0
            right = result;
        else
            left = result;
        end   
        result = (left + right)/2;
    end
end

