%Question 5.11 in text book.
f = @(x) 80 - x.^(3.5);
iteration = 0; 
xl = 2; 
xu = 5;
midpoint = (xl + xu)/2;
previous = xl;
current = xu;
while abs((current - previous)/current) * 100 > 2.5
    iteration = iteration + 1;
    previous = midpoint;
    if f(xl) * f(midpoint) < 0
        xu = midpoint;
    elseif f(xu) * f(midpoint) < 0
        xl = midpoint;
    end
    midpoint = (xl + xu)/2;
    current = midpoint;
end
root = midpoint;
hold on;
x = linspace(-100,100);
plot(x, f(x));
plot(root, f(root), 'ro');
plot(linspace(-100,100,100), zeros(100), '--');