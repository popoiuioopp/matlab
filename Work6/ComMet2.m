%{
Question 5.14 in text book.
Use bisection to determine the drag coeffi cient needed so that an 
82-kg parachutist has a velocity of 36 m/s after 4 s of free fall. 
Note:  The  acceleration of gravity is 9.81  m/s2. Start with  
initial guesses of xl=3 and xu=5and iterate until the approximate relative
error falls below 2%. Also perform an error check by sub-stituting your 
final answer into the original equation.
%}
f = @(c) ((9.81*82)./c).*(1-exp(-(c./82).*4)) - 36;
fplot(f);
grid on;
hold on;
es = 2;
xi = 3;
xu = 5;
xo = xi;
count = 0;
ea = 100;
while ea>es
    xm = (xi+xu)/2;
    fprintf("%f, %f, %f\n", f(xi), f(xu), f(xm));
    if f(xu)*f(xm) > 0
        xu = xm;
    elseif f(xi)*f(xm) > 0
        xi = xm;
    end 
    ea = 100 * abs((xm-xo)/xm);
    count = count + 1;
    xo = xm;
    fprintf("%f, %f, %f, %f, %f, %f, %f\n",xi, xu, xo, f(xi), f(xu), f(xo), ea)
end
plot(xm, f(xm), 'or', 'MarkerFaceColor', 'b');