function result = prob5func(x, N)
    result = 0;
    n = 0;
    while n <= N
        result = result + ((x.^n)/factorial(n));
        n = n + 1;
    end
end

