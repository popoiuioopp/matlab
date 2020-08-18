%{
5. Create a structure (give it a name) to save the following data
%}
my_structure = struct('name', {'Harry', 'Georgia', 'Elizabeth'}, 'age', ...
{36, 21, 78}, 'height', {170, 181, 158}, 'weight', {80, 70, 65});

%{
6.Change Georgia’s weight to be 68 kg.
%}
ind = find(my_structure.name == "Georgia")