function keydig = fk2dig(keyL,keyH, N)

    f=[697 770 852 941 1209 1336 1477 1633];
    fs=8000;
    df=fs/N;       
    k=round(f/df);
    k=k+1;
    
    if keyL==k(1)&&keyH==k(5) 
        keydig='1';
    end
    if keyL==k(1)&&keyH==k(6) 
        keydig='2';
    end
    if keyL==k(1)&&keyH==k(7) 
        keydig='3';
    end  
    if keyL==k(1)&&keyH==k(8)
        keydig='A';
    end
    if keyL==k(2)&&keyH==k(5)
        keydig='4';
    end
    if keyL==k(2)&&keyH==k(6) 
        keydig='5';
    end
    if keyL==k(2)&&keyH==k(7)
        keydig='6';
    end  
    if keyL==k(2)&&keyH==k(8)
        keydig='B';
    end
    if keyL==k(3)&&keyH==k(5)
        keydig='7';
    end
    if keyL==k(3)&&keyH==k(6) 
        keydig='8';
    end
    if keyL==k(3)&&keyH==k(7)
        keydig='9';
    end  
    if keyL==k(3)&&keyH==k(8)
        keydig='C';
    end
    if keyL==k(4)&&keyH==k(5)
        keydig='*';
    end
    if keyL==k(4)&&keyH==k(6) 
        keydig='0';
    end
    if keyL==k(4)&&keyH==k(7)
        keydig='#';
    end  
    if keyL==k(4)&&keyH==k(8)
        keydig='D';
    end

end