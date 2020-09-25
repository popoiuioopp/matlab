%{
5.Create the coefficient matrix for the following 
linear system, check that its determinant is not 0, 
then calculate it using the inverse matrix method 
(​hint:​ youcan find the inverse of a matrix with the 
​inv​ function).
%}
A = [3 4; 5 6]; B = [3; 7];
x1 = inv(A)*B;

%{
6.Solve the system above but using Matlab’s 
left-division operator.
%}
x2 = A\B;

%{
7.There are 3 reactors linked by pipes as shown below. 
The rate of transfer ofchemicals through each pipe is 
equal to a flow rate (Q, with units of cubic metersper ​
second) multiplied by the concentration of the reactor 
from which the floworiginates (c, with units of milligrams 
per cubic meter). If the system is at a steadystate, the 
transfer into each reactor will balance the transfer out. 
Developmass-balance equations for the reactors and solve 
the three simultaneous linearalgebraic equations for their 
concentrations.
%}
ayy = [130 -30 0; 90 -90 0; -40 -60 120];
bee = [500; 0; 500];
ecks = ayy\bee