fname = "data_pp4_q4.xls";

fprintf("Reading data from file: %s ... \n", fname);
a = xlsread(fname);
a_time = a(:,1);
a_data = a(:,2);

a_data(a_data>100) = 100; a_data(a_data<(-100)) = -100;
a(:,2) = a_data;
plot(a(:,1),a(:,2));