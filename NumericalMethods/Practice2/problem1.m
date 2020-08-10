%Plot the exponential function between x = -10 and 10 using a red dashed line 
%then plot thepoints at each integer value of x in large green crosses. 
%Remember to add axes labels and afigure title

x = [-10 : 10];
y = 2.^x;
plot(x, y, "xg", "MarkerSize", 10, "MarkerFaceColor", "g")
hold on
plot(x, y, "--r")
xlabel("x")
ylabel("y(2^x)")
title("x : 2^x")