function result = prob3cosx(x, N)
    result = 0;
    n = 0;
    while n <= N
        result = result + (((-1)^n)* x.^(2*n))/(factorial(2*n));
        n = n + 1;
end