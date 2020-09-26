hold on
fimplicit3(@(x, y, z) 3.*x - cos(y.*z) - 3/2);
fimplicit3(@(x, y, z) 4.*x.^2 - 625.*y.^2 + 2.*z - 1);
fimplicit3(@(x, y, z) 20.*z + exp(-x.*y) + 9);
hold off
y = fsolve(@prob9func, [-1, 30, 10]);