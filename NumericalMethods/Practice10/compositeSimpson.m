function A = compositeSimpson(f,a,b,n)
    if mod(n,2) == 0 && n > 1
        x = a : (b-a)/n : b;
        A = (b-a) / (3*n) * ( f(x(1)) + 4*sum(f(x(2:2:end-1))) + ...
            2*sum(f(x(3:2:end-2)))+f(x(end)));
    elseif n==3
        disp('3 intervals : using 3/8 rule')
        x = a : (b-a)/n : b;
        A = (b-a) / 8 * ( f(x(end-3)) + 3* f(x(end-2)) + 3*f(x(end-1)) + ...
            f(x(end)));
    elseif mod(n,2) == 1
        x = a : (b-a)/n : b;
        A1 = ( x(end-3)-a ) / (3*(n-3))*(f (x(1)) + 4 * sum(f(x(2:2:end-4))) + ...
            2*sum ( f( x(3:2:end-5))) + f(x(end-3)));
        A2 = (b-x(end-3))/8*(f(x(end-3)) + 3*f(x(end-2)) + 3*f(x(end-1)) + f(x(end)));
        A = A1+A2;
end

