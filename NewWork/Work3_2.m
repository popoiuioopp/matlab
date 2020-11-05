%{
3.2
Convert the following base-8 numbers to base-10: (a) 71263,
(b) 3.147
%}
all_bin = [71263, 3.147];
for j= 1:length(all_bin)
    
   cur_bin = num2str(all_bin(j));
   endpoint = length(cur_bin);
   result = [];
   value = 0;
   
   if contains(cur_bin, '.')
       endpoint = strfind(cur_bin, '.');
       for k= endpoint+1:length(cur_bin)
           value = value + (str2num(cur_bin(k)))*(8^(-(k-endpoint)));
       end
       endpoint = endpoint - 1;
   end
   
   for k= 1:endpoint
       value = value + (str2num(cur_bin(k))) * (8^(endpoint-k));
   end
   fprintf("%s = %f\n", cur_bin, value)
end