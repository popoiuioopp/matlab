%----------------------Question1----------------------%
f1a = @(y, x) ((x.^2)-(3.*y.^2)+(x.*y.^3));
f1b = @(x, y) (10-(4.*x)-(2.*y));
ans_a = integral2(f1a, -2, 2, 0, 4);
ans_b = integral2(f1b, 0, 1, @(x) 3.*x, @(x) 5-(2.*x));
fprintf("1.a.) The integral = %f\n", ans_a);
fprintf("1.b.) The integral = %f\n", ans_b); 

%----------------------Question2----------------------%
f2a = @(x, y, z) ((x.^3)-(2.*y.*z));
f2b = @(x, y, z) (6.*z.^2);
ans_a = integral3(f2a, -1, 3, 0, 6, -4, 4);
ans_b = integral3(f2b, 0, 5/2, 0, @(x) (10-x.*4), 0, @(x,y) (5-(2.*x)-(y./2)));
fprintf("2.a.) The integral = %f\n", ans_a);
fprintf("2.b.) The integral = %f\n", ans_b); 

%----------------------Question3----------------------%
f2a = @(x, y, z) ((x.^3)-(2.*y.*z));
f_test = @(x,y) (x .* exp(x-y));
n = 10000;
pointx = (-1)+(3-(-1)).*rand(n,1);
pointy = (6)+(0-(6)).*rand(n,1);
pointz = (4)+(-4-(4)).*rand(n,1);

range = f2a(pointx, pointy, pointz);
range_test = f_test((3)+(0-(3)).*rand(n,1), (2)+(0-(2)).*rand(n,1));

ans_monte = sum( (3+1).*(6-0).*(4-(-4)).*range )  / n;
ans_monte_test = sum (3 .* 2 .* range_test ) / n;
fprintf("3.) Monte-Carlo %d points = %f\n", n, ans_monte_test);

%----------------------Question4----------------------%
f = @(y, x) x .* exp(x - y);
n = 100;
error = 100;
i = 1;
prev(i) = 0;
true_val = 35.599174;
while error > 0.5
    i = i + 1;
    range_test = f((2)+(0-(2)).*rand(n,1), (3)+(0-(3)).*rand(n,1));
    prev(i) = sum (3 .* 2 .* range_test ) / n;
    fprintf("val = %f\n", prev(i));
    error = abs(prev(i) - true_val) / true_val * 100;
end
fprintf("Looped = %d times\n", i - 1);

%----------------------Question5----------------------%

%----------------------Question6----------------------%
H = 30;
f = @(z) 200 .* (z / (5 + z)) .* exp(-2.*z ./ 30);