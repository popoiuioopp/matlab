function y_array = HeunIterativeMethod(dy,start,final,init,step,tol)
% credit tim.

t = start:step:final  ;
y_array =  [ init ]; 

for j = 1:length(t)-1
    init_slope = dy(t(j),y_array(j));
    init_next_y = y_array(j) + ( init_slope * step );
    iter = 0;
    while iter < 100
        next_slope = dy(t(j)+step,init_next_y);
        avg_slope = ( init_slope + next_slope )/2;
        new_next_y = y_array(j) + ( avg_slope * step );
        err = ( abs(( new_next_y - init_next_y ) / new_next_y ) ) * 100;
        if err < tol
            y_array(end+1) = new_next_y;
            break
        else
            init_next_y = new_next_y;
            iter = iter + 1;
        end
    end
end