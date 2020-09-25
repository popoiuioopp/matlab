%--------Incremental search----------%
h = 0.2; starting = -10; ending = 10;
n0 = starting;
n1 = n0 + h;
while n1 < ending && (prob9func(n0)*prob9func(n1)) > 0
    n0 = n1;
    n1 = n0 + h; 
    fprintf("%f, %f\n------------------------------", prob9func(n0), prob9func(n1));
end

%--------Bisection Method----------%
tol = 0.00001;
mid = (n0 + n1)/2;
while (abs(prob9func(mid))) > tol
    if prob9func(n0) * prob9func(mid) < 0
        n1 = mid;
    else
        n0 = mid;
    end   
    mid = (n0 + n1)/2;
    fprintf("%f %f %f\n", n0, mid, n1);
end
