function x1 = NewtonRaphson(f, x0, error)
    syms x;
    f1 = matlabFunction(diff(f(x)));
    iteration = 0;
    x1 = f1(x0);
    while abs((x1-x0)/x1) * 100 > error
        iteration = iteration + 1;
        x0 = x1;
        x1 = x0 - (f(x0)/f1(x0));
    end
end