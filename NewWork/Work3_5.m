%{
    The infinite series 
        f(n) = sum(1/(i^4))
    Converge on a value of f(n) = pi^4/90 as n approaches infinity.
    Write a program in single precision to calculate f(n) for n = 10,000
    by computing the sum from i = 1 to 10,000. Then repeat the calculation
    but in reverse order---that is, from 10,000 to 1 using increment of-1.
    In each case, compute the true percent relative error. Explain the
    result.
%}
result_decre = 0;
result_incre = 0;
n = 10000;
true_val = (pi^4)/90;

for i= 1:n
   result_incre = result_incre + 1/(i^4);
end

for i= n:-1:1
   result_decre = result_decre + 1/(i^4);
end

fprintf("Single Precision\n1 to 10000 = %.20f\n10000 to 1 = %.20f\nTrue value = %.20f\n",...
    single(result_incre), single(result_decre), single(true_val));
fprintf("True percent relative error of incresing = %.20f%%\n", ...
    (abs(single(result_incre)-single(true_val))/single(true_val)) * 100);
fprintf("True percent relative error of decresing = %.20f%%\n", ...
    (abs(single(result_decre)-single(true_val))/single(true_val)) * 100);
fprintf("\n");

fprintf("Double Precision\n1 to 10000 = %.20f\n10000 to 1 = %.20f\nTrue value = %.20f\n",...
    double(result_incre), double(result_decre), double(true_val));
fprintf("True percent relative error of incresing = %.20f%%\n", ...
    (abs(double(result_incre)-double(true_val))/double(true_val)) * 100);
fprintf("True percent relative error of decresing = %.20f%%\n", ...
    (abs(double(result_decre)-double(true_val))/double(true_val)) * 100);

fprintf("\nWe won't see the difference between increasing, decreasing, and the\ntrue value in the single-precision format because single precision only uses\n32bits of memory to store the value and since the difference is very small so\nsingle precision is not enough.\nWe will start to see the difference between increasing, decreasing, and the\ntrue value in the double-precision which the increasing of i from 1 to 10,000\nhas less true percent relative error than the other one.\n");