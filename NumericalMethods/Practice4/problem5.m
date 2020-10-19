x = linspace(0, 5);
hold on;
plot(x, exp(x));
for j = 1 : 5
    plot(x, prob5func(x, 2^(j-1)));
end

%{
Question 6
%}
tol = 0.0001;
n = 0;
result = (4^(n + 1))/factorial(3*n + 1);
result0 = 0;
error = 1;
while error > tol
    result = result + (4^(n + 1))/factorial(3*n + 1);
    error = abs(result - result0);
    result0 = result;
    n = n + 1;
end

%{
Question 7
%}
m = 0;
rtol = 0.001;
rerror = 1;
result = (4^(m + 1))/factorial(3*m + 1);
result0 = 0;
while rerror > rtol
    result = result + (4^(m + 1))/factorial(3*m + 1);
    rerror = abs((result - result0)/result);
    result0 = result;
    m = m + 1;
end

%{
Question 8
%}
