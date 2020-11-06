%{
Calcculate the random access memory(RAM) in megabytes
neccessary to store a multidimensional array that is
                20 x 40 x 120
This array is double precision, and each value requires 
a 64-bit word. A 64-bit word = 8 bytes and 1 kilobyte = 
                    2^10
bytes. Assume that the index starts at 1
%}
number = 20 * 40 * 120;
total_bytes = number * 8;

kilo = (total_bytes/2^10);
mega = kilo/2^10;
fprintf("Total Kilobytes = %f Kilobytes\nTotal Megabytes = %f Megabytes\n", kilo, mega);