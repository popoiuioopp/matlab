%--------Incremental search----------%
h = 0.2; starting = -10; ending = 10;
n0 = starting;
n1 = n0 + h;
while n1 < ending && (prob9func(n0)*prob9func(n1)) > 0
    n0 = n1;
    n1 = n0 + h; 
    fprintf("%f, %f\n", prob9func(n0), prob9func(n1));
end

%--------Bisection Method----------%
tol = 0.0001;
n2 = (n0 + n1)/2;
while abs(n0 - n1) > tol
    if n0 * n2 < 0
        n1 = n2;
    else
        n0 = n2;
    end   
    n2 = (n0 + n1)/2;
    fprintf("%f %f %f\n", n0, n2, n1);
end