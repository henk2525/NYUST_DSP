% y(n) = x(n)*h(n)
% x(n) = u(n)-u(n-10), h(n) = u(n-2)-u(n-6)

x = [ones(10,1);zeros(31,1)];
h = [0;0;1;1;1;1;zeros(35,1)];
y = conv(x, h);
m = length(x)+length(h)-1;
stem(0:m-1, y, 'fill');