%system model: y(n) + 0.9y(n-1) = 2x(n) ; y(-1) = 0
%case:x(n) = cos(0.1*pi*n)u(n)


n = 0:59;
b = [2];
a = [1 0.9];
x = cos(0.1*pi*n).';
y = filter(b, a, x);
figure
stem(n, [x y], 'fill');
xlabel('n')
title('Subproblem (d)');
legend('x(n)', 'y(n)');