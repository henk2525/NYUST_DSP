function [KL,KH] = findk(x,N)

    f=[697 770 852 941 1209 1336 1477 1633];
    fs=8000;
    df=fs/N;       
    k=round(f/df);
    k=k+1;
    
    KL = k(1);
    KH = k(5);
    
    for i = 2:4
        if x(k(i)) > x(KL)
            KL = k(i);
        end
    end
    for i = 6:8
        if x(k(i)) > x(KH)
            KH = k(i);
        end
    end
end
