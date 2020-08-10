%Use 2 subplots above and below each other to plot both sin(x) and cos(x) 
%between -2? and 2?.Customise the plots any way you like
x = [-2*pi : 2*pi];
y = [sin(x)];
z = [cos(x)];
subplot(2, 1, 1)
plot(x, y, "ok--", "MarkerFaceColor", "k")
xlabel("x")
ylabel("y(sin(x))")

subplot(2, 1, 2)
plot(x, z, "or--", "MarkerFaceColor", "r")
xlabel("x")
ylabel("y(cos(x))")