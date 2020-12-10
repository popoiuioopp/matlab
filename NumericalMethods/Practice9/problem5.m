%{
5.Use the portion of the given steam table for 
superheated water at 200 MPa to find:

(a) the corresponding ​entropy ​s​ for a specific 
volume ​υ​ of 0.118 with linear interpolation,
%}
v = [0.10377 0.11144 0.12547];
s = [6.4147  6.5453  6.7664] ;

[newton_res, newton_fd] = boss_new_inter(v(2:3),s(2:3),0.118);
lagrange_res = lagrange(v(2:3), s(2:3), 0.118);

x = v(1,2:3); y = s(1,2:3)';
xx = [x(1), 1; x(2), 1];
p = pinv(xx) * y;  % >>>> SVD to calculate the inverse.
p= xx\y;
leftDiv_result = polyval(p', 0.118);

%{
(b) the same corresponding entropy using quadratic 
interpolation, and
%}
v = [0.10377 0.11144 0.12547];
s = [6.4147  6.5453  6.7664] ;

[newton_res, newton_fd] = boss_new_inter(v, s, 0.118);
lagrange_res = lagrange(v, s, 0.118);

%{
(c) the volume corresponding to an entropy of 6.45 
using inverse interpolation ofboth the linear and 
quadratic cases.
%}
v = [0.10377 0.11144 0.12547];
s = [6.4147  6.5453  6.7664] ;

lin_co = polyfit(v(1:2), s(1:2), 1);
quad_co = polyfit(v, s, 2);

lin_co_res = fzero(@(x) polyval(lin_co, x) - 6.45, v(1));
quad_co_res = fzero(@(x) polyval(quad_co, x) - 6.45, v(1));
hold on;

scatter(v,s);

fplot(@(x) polyval(lin_co, x), [v(1), v(2)]);
fplot(@(x) polyval(quad_co, x), [min(v), max(v)]);

plot(lin_co_res, polyval(lin_co, lin_co_res), 'r*')
plot(quad_co_res, polyval(quad_co, quad_co_res), 'g*')