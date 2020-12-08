% 1 4 5 7 8 -Done- -> 2/3
%{
Find an interpolating polynomial using matrices to 
determine y at x = 3. Try linear,quadratic, and cubic 
polynomials between appropriate data points first, 
then try apolynomial that interpolates the entire 
data set. Make one plot with the data alongwith the 
4 interpolating polynomials, then another plot with 
degree of interpolatingpolynomial on the horizontal axis 
and the estimated value of y at x = 3 on thevertical axis.
%}
x = [0 1.8 5 6 8.2 9.2 12];
y = [26 16.415 5.375 3.5 2.015 2.54 8];
clf;

%Linear : 2 unknowns : p1x + p2
Alinear = x(2:3)';
xx = linspace(min(Alinear), max(Alinear));
Alinear = [Alinear'; 1 1]';
Blinear = y(2:3)';
plinear = Alinear\Blinear;
y_ans_linear = polyval(plinear, 3);
subplot(2,2,1);
hold on;
scatter(x, y, 'filled');
plot(xx, polyval(plinear, xx));
plot(3, y_ans_linear, 'dk');
title('Subplot 1: Linear')

%Quadratic : 3 unknowns : p1x^2 + p2x + p3
Aquad = x(1:3)';
xx = linspace (min(Aquad), max(Aquad));
Aquad = [(Aquad.^2)';Aquad'; 1 1 1]';
%or Aquad = [Aquad.^2 Aquad ones(3,1)]
Bquad = y(1:3)';
pquad = Aquad\Bquad;
y_ans_quad = polyval(pquad, 3);
subplot(2,2,2);
hold on;
scatter(x, y, 'filled');
plot(xx, polyval(pquad, xx));
plot(3, y_ans_quad, 'dk');
title('Subplot 2: Quadratic')

%Cubic : 4 unknowns : p1x^3 + p2x^2 + p3x + p4
Acub = x(1:4)';
xx = linspace (min(Acub), max(Acub));
Acub = [Acub.^3 Acub.^2 Acub ones(4,1)];
Bcub = y(1:4)';
pcub = Acub\Bcub;
y_ans_cub = polyval(pcub, 3);
subplot(2,2,3);
hold on;
scatter(x, y, 'filled');
plot(xx, polyval(pcub, xx));
plot(3, y_ans_cub, 'dk');
title('Subplot 3: Cubic')

%All dataset : degree of 6 (n-1):  
Aall = x(1:end)';
xx = linspace(min(Aall), max(Aall));
xsize = max(size(x));
Aall = [Aall.^(xsize-1) Aall.^(xsize-2) Aall.^(xsize-3) Aall.^(xsize-4) Aall.^(xsize-5) Aall ones(7,1)];
Ball = y(1:end)';
pall = Aall\Ball;
y_ans_all = polyval(pall, 3);
subplot(2,2,4);
hold on;
scatter(x, y, 'filled');
plot(xx, polyval(pall, xx));
plot(3, y_ans_all, 'dk');
title('Subplot 4: All points')