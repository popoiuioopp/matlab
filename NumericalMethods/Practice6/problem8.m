%W6Q8
f1 = @(x,y) exp(x*y)-y^2;
f2 = @(x,y) cos(x+y);
fimplicit(f1,[-10,10]);
hold on
fimplicit (f2,[-10,10]);

dsolve()
