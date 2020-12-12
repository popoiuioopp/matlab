function result = prob1Func(x,y)
    p = polyfit(x,y,3);
    dp = polyder(p);
    result = polyval(dp, x);
    hold on;
    plot(x,y,'o');
    fplot(@(x) polyval(p, x), [min(x), max(x)]);
end

