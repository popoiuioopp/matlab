function result = incremental(f, starting, ending)
    h = 0.01; n0 = starting; n1 = n0 + h; result = [];
    while n1 < ending
        n0 = n1;
        n1 = n0 + h;
        if (f(n0)*f(n1)) < 0
            result = [result n0 n1];
        end
    end
    result = round(result, 2); result = unique(result);
end