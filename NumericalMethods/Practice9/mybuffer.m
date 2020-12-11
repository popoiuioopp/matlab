function r = mybuffer(x,size,overlap)
%MYBUFFER
    r = [];
    for j = 1:(size-overlap):length(x)-(size-1)
        r(:,end+1) = x(j:j+(size-1));
    end
end