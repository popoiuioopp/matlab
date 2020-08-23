%{
5. Create a structure (give it a name) to save the following data
%}
my_structure = struct('name', {'Harry', 'Georgia', 'Elizabeth'}, 'age', ...
{36, 21, 78}, 'height', {170, 181, 158}, 'weight', {80, 70, 65});

%{
6.Change Georgia’s weight to be 68 kg.
%}
for j=1 : length(my_structure)
    if strcmp(my_structure(j).name,'Georgia')
        my_structure(j).weight = 68;
    end
end

%{
7.Add an extra person to the data with the following details: Name, Lily; 
Age, 24; Height, 162cm; Weight, 60 kg.
%}
my_structure(4).name = 'Lily';
my_structure(4).age = 24;
my_structure(4).height = 162;
my_structure(4).weight = 60;

%{
8.Using one line of code calculate the mean height of the group.
%}
mean([my_structure.height])

%{
9.BMI is given by Mass (kg) divided by Height (metres) squared. Calculate 
the BMI of eachperson in the group and make a new field in your structure 
that saves this data for each person.
%}
cell_size = size(my_structure)
for j = 1 : cell_size(2)
    my_structure(j).('bmi') = my_structure(j).weight/(my_structure(j).height/100)^2
end

%{
10.Use the sprintf function to display the names of the people in the group 
along with their age,height and BMI displaying each value to 2 decimal places).
%}

for j = 1 : cell_size(2)
    disp(sprintf('Name:%s \nage:%d \nheight:%d \nBMI:%.2f\n\n',my_structure(j).name, ...
    my_structure(j).age, my_structure(j).height ,my_structure(j).bmi))
end