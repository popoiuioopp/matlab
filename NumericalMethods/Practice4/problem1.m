n = 1;
while 1
    disp(factorial(n));
    n = n + 1;
    if factorial(n) == inf
        disp(factorial(n))
        break
    end
end
