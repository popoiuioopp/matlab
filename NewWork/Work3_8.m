%{
    3.8 (a) Evaluate the polynomial
       y = x.^3 - 5.*x.^2 + 6.*x + 0.55;
    at x = 1.37. Use 3-Digits arithmetic 
    with chopping. Evaluate the percent 
    relative error.
    (b) Repeat (a) but express y as 
       y = ((x-5).*x +6).*x+0.55;
    evaluate the error and compare with 
    part (a).
%}
x = 1.37;
true_val = x.^3 - 5.*x.^2 + 6.*x + 0.55;

x2 = fix(((x)^2)*0.1/0.001)*0.01;
x3 = fix((x2*x)*0.1/0.001)*0.01;
y_a = x3 - 5*x2 + 6*x + 0.55;

x5x = fix(((x-5).*x)/0.01)*0.01;
x5x6x = fix(((x5x+6)*x)/0.01)*0.01;
y_b = x5x6x + 0.55;

fprintf("(a) y = %f Percent Relative Error = %f%%\n", ...
    y_a, (true_val-y_a)/true_val*100);

fprintf("(b) y = %f Percent Relative Error = %f%%\n", ...
    y_b, (true_val-y_b)/true_val*100);

fprintf("(b) has less error, it is better to use the second formula.\n");