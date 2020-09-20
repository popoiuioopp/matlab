function result = problem29(tol)
sum = 0;
j = 0;
while (1 - sum) > tol
    j = j + 1;
    sum = sum + (1/2^j);
end
result = j;