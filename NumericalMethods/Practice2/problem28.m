function mat = problem28(x, mat)
mat([find(mat>x)]) = 0;
end