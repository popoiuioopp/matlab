function result = derivative(f, x)
    step = 0.000000001;
    result = (f(x+step) - f(x))/step;
end

