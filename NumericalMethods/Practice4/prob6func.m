function result = prob6func(x, N)
    result = 0;
    n = 0;
    while n < N
        result = result + (4^(n + 1))/factorial(3*n + 1);
        n = n + 1;
    end
end

