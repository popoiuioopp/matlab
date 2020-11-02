%{
5.17  
You are designing a spherical tank (Fig. P5.17) to 
hold water for a small village in a developing country. 
The volume of liquid it can hold can be computed as 
where V=volume (m3), h=depth of water in tank (m), 
and R=the tank radius (m). If R = 3m, to what depth 
must the tank be filled so that it holds  30 m3? 
Use three iterations of the false-position method to 
determineyour answer. Determine the approximate relative error 
after each iteration. Employ initial guesses of 0 and R.
%}
V = 30; R = 3; 
f = @(h) pi.*h.^2.*(3.*R - h)./3 - V;
error = 2; 
a = 0; b = R; 
while abs(b - a)/2 * 100 > error
    c = (a+b)/2;
    if f(b)*f(c) > 0
        b = c;
    else
        a = c;
    end
end
estRoot = (a+b)/2;

hold on;
fplot(f);
plot(estRoot, f(estRoot), '*r');
grid on;