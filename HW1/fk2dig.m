function keydig = fk2dig(keyL,keyH)

if keyL==18&&keyH==31 
	keydig='1';
end
if keyL==18&&keyH==34 
	keydig='2';
end
if keyL==18&&keyH==38 
	keydig='3';
end  
if keyL==18&&keyH==42 
	keydig='A';
end
if keyL==20&&keyH==31 
	keydig='4';
end
if keyL==20&&keyH==34 
	keydig='5';
end
if keyL==20&&keyH==38 
	keydig='6';
end  
if keyL==20&&keyH==42 
	keydig='B';
end
if keyL==22&&keyH==31 
	keydig='7';
end
if keyL==22&&keyH==34 
	keydig='8';
end
if keyL==22&&keyH==38 
	keydig='9';
end  
if keyL==22&&keyH==42 
	keydig='C';
end
if keyL==24&&keyH==31 
	keydig='*';
end
if keyL==24&&keyH==34 
	keydig='0';
end
if keyL==24&&keyH==38 
	keydig='#';
end  
if keyL==24&&keyH==42 
	keydig='D';
end

end