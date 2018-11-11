%system model: y(n) + 0.9y(n-1) = 2x(n) ; y(-1) = 0
%case:x(n) = £_(n)

n = 0:60;
b = [2];
a = [1 0.9];
x = [1 zeros(1, length(n)-1)].';
y = filter(b, a, x);
figure
stem(n, [x y], 'fill');