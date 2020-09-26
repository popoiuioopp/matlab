function result = false_position(f, starting, ending)
    if f(starting)*f(ending) > 0
        result = [];
        return;
    end
    tol = 0.001;
    a = starting; b = ending; result = a - ((f(a)*(b-a))/(f(b)-f(a)));
    while abs(starting - ending) > tol
        if f(a) * f(result) < 0
            b = result;
        else
            a = result;
        end
        result = a - ((f(a)*(b-a))/(f(b)-f(a)));
    end
end

