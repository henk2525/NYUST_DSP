function  [Y] = myFilter(b, a, X)

% (method1) direct form II transposed implementation 
% n    = length(a);
% z(n) = 0;
% Y    = zeros(size(X));
% for m = 1:length(Y)
%     Y(m) = b(1) * X(m) + z(1);
%     for i = 2:n
%         z(i - 1) = b(i) * X(m) + z(i) - a(i) * Y(m);
%     end
% end
% end

% (method2)direct form II structure
w=zeros(size(X));
Y=zeros(size(X));
for i=0:length(X)-1
    for j=0:length(a)-1
        if((i-j) >= 0)
            if(j==0)
                w(i+1)=w(i+1)+X(i+1);
            else
                w(i+1)=-a(j+1)*w(i-j+1)+w(i+1);
            end
        end
    end
end
for i=0:length(X)-1
    for k=0:length(b)-1
        if((i-k) >= 0)
            Y(i+1)=b(k+1)*w(i-k+1)+Y(i+1);
        end
    end
end
end
    





