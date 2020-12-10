function [result, fd] = boss_new_inter(x,y,desire_x)

n = length(x);fd = zeros(n, n+1); fd(:,1) = x;  fd(:,2) = y; 

for j = 1: n-1
    for k = 1: n-j
       fd(k, j+2) = (fd(k+1, j+1) - fd(k, j+1)) ...
           / (fd(j + k, 1) - fd(k, 1));
    end
end

if length(desire_x) < 2
    temp = ones(1, n-1);
    for j = 1: n-1
        for k = 1: j
            temp(j) = temp(j) * (desire_x - x(k));
        end
    end
    result = sum(fd(1,3:end) .* temp) + y(1);
else
    result = zeros(1, length(desire_x));
    for a = 1 : length(desire_x)
        this_x = desire_x(a); 
        temp = ones(1, n-1);
        for j = 1: n-1
            for k = 1: j
                temp(j) = temp(j) *  (this_x - x(k));
            end
        end
        result(a) = sum(fd(1,3:end) .* temp) + y(1);
    end
end
end

