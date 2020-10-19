function result = problem5func(f, startpoint, endpoint, n)
    h = (endpoint - startpoint)/n;
    %fprintf("step: %f", h);
    x = (startpoint+h) : h : (endpoint-h);
    %disp(x);
    sum_of_fx = sum(f(x));
    %disp(sumofy);
    result = (h/2)*(f(startpoint)+2*sum_of_fx+f(endpoint));
end

