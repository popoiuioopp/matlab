%{
    The derivative of f(x) = 1/(1 - 3x^2) is given by
            6x/(1-3x^2)^2
    Do you expect to have difficulties evaluating this function
    at x=0.577? Try it using 3- and 4-digits arithmetic with
    chopping.
%}
x = 0.577;
true_val = (6*x)/(1-3*x^2)^2;

%{
https://www.slader.com/discussion/question/compose-your-own-program-and-use-it-to-determine-your-computers-machine-epsilon/#
%}