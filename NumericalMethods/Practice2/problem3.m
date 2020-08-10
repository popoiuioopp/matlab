%{
Plot the following data in a pie chart and explode the Honda 
and Mercedes segments
%}

number_of_sales = [37210, 412178, 366040, 53442, 157803, 210000, 845213];
explode = [0, 1, 0, 1, 0, 0, 0];
labels = {"BMW", "Honda", "Isuzu", "Mercedes", "Mitsubishi", "Nissan", "Toyota"};
pie(number_of_sales, explode, labels)