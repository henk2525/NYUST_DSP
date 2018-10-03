function [KL,KH] = findk(x,N)
    r = zeros(2);
    i = 1;
    for n = 1:round(N/2)
        if x(n) > 30
            r(i) = n;
            i = i+1;
        end
    end
    KL = r(1)-1;
    KH = r(2)-1;
end
