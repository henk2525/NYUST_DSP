% y(n) = x(n)*h(n)
% x(n) = (1/2)^n*u(n), h(n) = (1/3)^n*u(n-2)

n = 0:50;
m = 0:100;
x = 0.5.^n.';
h = (1/3).^n.';
h(1:2) = [0;0];
y = conv(x, h);
stem(m, y, 'fill')