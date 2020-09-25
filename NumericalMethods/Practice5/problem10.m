r = 2; L = 5; V = 8;

h = @(x) ((r^2)*acos((r-x)/r) - (r-x)*sqrt(2*r*x - (x)^2))*L - V;

fzero(h, 1)
