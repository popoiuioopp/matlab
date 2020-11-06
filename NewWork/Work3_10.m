%{
Determine the number of terms necessary to approximate cos x
to 8 significant figures using the Maclaurin series approximation

    cos x = 1 - (x^2)/2 + (x^4)/4! - (x^6)/6! + (x^8)/8! - ...

Calculate the approximation using a value of x = 0.3*pi. Write a
program to determine your result.
%}
x = 0.3*pi;
res = [];
j = 1;
while 1
    result = 0;
    n = 0;
    while n < j
        result = result + (((-1)^n)* x.^(2*n))/(factorial(2*n));
        n = n + 1;
    end
    res = [res result];
    if length(res) > 1 
       fprintf("Iter : %d, Approximation = %.10f, Error = %.10f\n", j, result,...
           abs(res(end)-res(end-1))/res(end));
       if abs(res(end)-res(end-1))/res(end) < 10^(-8)
           break;
       end
    else 
        fprintf("Iter : %d, Approximation = %.10f, Error = %f\n", j, result, []);
    end
    j = j + 1;
end
fprintf("Total iteration = %d, Approximation = %.10f\n", j ,res(end));