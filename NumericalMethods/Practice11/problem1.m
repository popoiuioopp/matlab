%----------------------Question1----------------------%
f1a = @(x, y) ((x.^2)-(3.*y.^2)+(x.*y.^3));
f1b = @(x, y) (10-(4.*x)-(2.*y));
ans_a = integral2(f1a, 0, 4, -2, 2);
ans_b = integral2(f1b, 0, 1, @(x) 3.*x, @(x) 5-(2.*x));
disp(ans_a);
disp(ans_b);

%----------------------Question2----------------------%
f2a = @(x, y, z) ((x.^3)-(2.*y.*z));
f2b = @(x, y, z) (6.*z.^2);
ans_a = integral3(f2a, -1, 3, 0, 6, -4, 4);
ans_b = integral3(f2b, 0, 5/2, 0, @(x) (10-x.*4), 0, @(x,y) (5-(2.*x)-(y./2)));
disp(ans_a);
disp(ans_b);

%----------------------Question3----------------------%
f2a = @(x, y, z) ((x.^3)-(2.*y.*z));
n = 1000;
pointx = (-1)+(3-(-1)).*rand(n,1);
pointy = (6)+(0-(6)).*rand(n,1);
pointz = (4)+(-4-(4)).*rand(n,1);
scatter3(pointx,pointy,pointz);

