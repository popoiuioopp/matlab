%W6Q8
f1 = @(x,y) exp(x*y)-y^2;
f2 = @(x,y) cos(x+y);
fimplicit(f1,[-3,3]);
hold on
fimplicit (f2,[-3,3]);

iniguess = [-2.13,0.56;
            -0.33,-1.24;
            0.33,1.24;
            2.16,-0.589];

for k = 1:1:4
    %options = optimoptions('fsolve','Display','off');
    [x,fval] = fsolve(@(x) prob8func(x),iniguess(k,:));
    fprintf('x= %f\n fval= %f\n',x,fval)
end