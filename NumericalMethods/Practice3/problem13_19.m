%{
13 Create a random 4 x 4 matrix, ​A​, with values between 0 
and 1 then swap the 2​nd​ and 4​th​ row using one line of code.
%}
A = rand(4);
Temp = [1 0 0 0 ; 0 0 0 1 ; 0 0 1 0 ;0 1 0 0];
A([1 4 3 2], :);
%OR
A = Temp*A;

%{ 
14 Using the matrix, ​A​, from Q13 now swap the 1​st​ and 4​th​ 
columns using one line of code.
%}
A = transpose(Temp*transpose(A));

%{
15. Using one line of code set every value of ​A​ that is 
greater than 0.5 equal to 7.
%}
A(find(A > 0.5)) = 7;

%{
16. Create a 4 x 7 matrix, ​B​, of random integers between 
10 and 50 then using one line of code set every value 
of ​B​ that is both greater than 20 and less than 40 equal 
to 0 (​Hint:​ Read about‘&’ and ‘|’ logical operators in 
the documentation).
%}
B = randi([10, 50], 4, 7);
B(find(B>20 & B<40)) = 0;

%{
17.Using one line of code insert the column vector in 
between the 5​th​ and 6​th​ columns of ​B​.
%}
[B(:, 1:5) randi([10, 50], 4, 1) B(:, 6:end)];

%{
18.Using one line of code insert the row vector 
[3 -2 4 8 9 11 0] in between the 2​nd​ and 3​rd​ rows of ​B
%}
[B(1:2, :); [3 -2 4 8 9 11 0]; B(3:end, :)];

%{
19.Create an anonymous function in the command window 
for the function ​f​(​x​) = ​x​2​ – 3​x​ + 1.Plot this function 
between -4 and 4 with a grid.
%}
f = @(x) x.^3 - 3.*x + 1;
plot(linspace(-4, 4, 100), f(linspace(-4, 4, 100)))
grid on;
