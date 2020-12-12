function result = prob4Func(x, y, desire_x, h)
    i = find(x == desire_x);
    result = ( -y(i+2) + 8*y(i+1) - 8*y(i-1) + y(i-2) )  / (12*h);
end

