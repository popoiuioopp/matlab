%{
26.Convert the script into a function which accepts a value, ​n​, as an input
argument to make an ​n​x​n​ matrix. Set the even numbers equal to 0.
%}
function result = problem26(n)
    result = randi([1, 100], n);
    indexes = find(mod(result, 2) == 0);
    result([indexes]) = 0
end