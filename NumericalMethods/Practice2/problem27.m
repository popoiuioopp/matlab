 function mat = problem27(n, m)
    mat = randi([1, 100], [n, m]);
    disp("Matrix nxm = ");
    disp(mat);
    mat([find(mod(mat,2)~=0)]) = 0;
 end