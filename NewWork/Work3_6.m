%{
evaluate e^(-5) using two approaches

e^(-x) = 1 - x + (x^2)/2! - (x^3)/3! + .......
and
e^(-x) = 1/e^x = 1/(1 - x + (x^2)/2! - (x^3)/3! + .......)

and compare with the true value of 6.737947 x 10^-3. Use 20 terms
to evaluate each series and compute true and approximate relative 
error as term are added.
%}

n = 20;
x = 5;
true_val = 6.737947*10^(-3);

disp("----------FIRST---------");
result_1 = 0;
vec_res_1 = [];
error_res_1 = [];
for i= 1:n
    result_1 = result_1 + ((-x)^(i-1))/factorial(i-1);
    vec_res_1 = [vec_res_1 result_1];
    if length(vec_res_1) > 1
        error = (vec_res_1(end) - vec_res_1(end-1))/vec_res_1(end);
        error_res_1 = [error_res_1 error];
        fprintf("Iter = %d Approximation = %f Approximate Relative Error =%f\n", i, result_1, error);
    else
        fprintf("Iter = %d Approximation = %f Approximate Relative Error =%s\n", i, result_1, " ");
    end
end

disp("----------SECOND---------");
result_2 = 0;
vec_res_2 = [];
error_res_2 = [];
for i= 1:n
    result_2 = result_2 + ((x)^(i-1))/factorial(i-1);
    vec_res_2 = [vec_res_2 result_2];
    if length(vec_res_2) > 1
        error = (vec_res_2(end) - vec_res_2(end-1))/vec_res_2(end);
        error_res_2 = [error_res_2 error];
        fprintf("Iter = %d Approximation = %f Approximate Relative Error =%f\n", i, 1/result_2, error);
    else
        fprintf("Iter = %d Approximation = %f Approximate Relative Error =%s\n", i, 1/result_2, " ");
    end
end
result_2 = 1/result_2;

disp("-------------------");
fprintf("First approach result = %f, Approximate Relative Error = %f\n", ...
    result_1, error_res_1(end));
fprintf("Second approach result = %f, Approximate Relative Error = %f\n", ...
    result_2, error_res_2(end))
fprintf("True value = %f\n", true_val);
disp("-------------------");
fprintf("The Second Approch converge faster to the true value faster than the \nfirst one.\n");
disp("-------------------");