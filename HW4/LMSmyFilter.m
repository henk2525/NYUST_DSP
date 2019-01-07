function [W,en]=LMSmyFilter(xn,vn,p,u)

itr = length(xn);
en = zeros(itr,1); 
y =  zeros(itr,1);
W  = zeros(p,itr); 
for k = p:itr
    v = vn(k:-1:k-p+1);
    y(k) = W(:,k-1).' * v;
    en(k) = xn(k) - y(k) ;
    W(:,k) = W(:,k-1) + u*en(k)*v;
end
