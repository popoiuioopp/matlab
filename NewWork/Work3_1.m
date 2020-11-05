%{
3.1
Convert the following base-2 numbers to base-10: (a) 101101,
(b) 101.011 and (c) 0.01101
%}
all_bin = [101101, 101.011, 0.01101];
for j= 1:length(all_bin)
    
   cur_bin = num2str(all_bin(j));
   endpoint = length(cur_bin);
   result = [];
   value = 0;
   
   if contains(cur_bin, '.')
       endpoint = strfind(cur_bin, '.');
       for k= endpoint+1:length(cur_bin)
           value = value + (str2num(cur_bin(k)))*(2^(-(k-endpoint)));
       end
       endpoint = endpoint - 1;
   end
   
   for k= 1:endpoint
       value = value + (str2num(cur_bin(k))) * (2^(endpoint-k));
   end
   fprintf("%s = %f\n", cur_bin, value)
end