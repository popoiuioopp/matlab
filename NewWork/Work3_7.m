%{
    The derivative of f(x) = 1/(1 - 3x^2) is given by
            6x/(1-3x^2)^2
    Do you expect to have difficulties evaluating this function
    at x=0.577? Try it using 3- and 4-digits arithmetic with
    chopping.
%}
x = 0.577;
true_val = (6*x)/(1-3*x^2)^2;

% 3-Digits
x6 = fix((6*x)/0.01) * 0.01;
x2 = fix((x^2)/0.001) * 0.001;
x23 = fix(3*(x2)/0.001) * 0.001;

result_3digits = x6/(1-x23)^2;

% 4-Digits
x6 = 6*x;
x2 = fix((x^2)/0.0001) * 0.0001;
x23 = fix(3*(x2)/0.0001) * 0.0001;

result_4digits = x6/(1-x23)^2;
fprintf("\n3-Digits result = %f\n4-Digits result = %f\nTrue value = %f\n",...
    result_3digits, result_4digits, true_val);
fprintf("\nPercent Relative Error :\n3-Digits = %f%%\n4-Digits = %f%%\n", ...
    abs(true_val-result_3digits)/true_val*100, abs(true_val-result_4digits)/true_val*100);
fprintf("Chopping will create an error that effect the result a lot. The less chopping, the more error will be.\n");