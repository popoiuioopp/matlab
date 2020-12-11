function result = problem6func(f, startpoint, endpoint, n)
    % Normal simson's 1/3 rule : I = (h/3) * ( f(x0) + 4f(x1) + f(x2) );
    h = (endpoint - startpoint) / n;
    
    list = (startpoint:h:endpoint);
    
    odd = f(list(2:2:end));
    even = f(list(3:2:end-1));
    sumOdd = sum( odd ) * 4;
    sumEven = sum( even ) * 2;
    result = h * (f(startpoint) + sumOdd + sumEven + f(endpoint)) / 3;
end


