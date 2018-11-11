%system model: y(n) + 0.9y(n-1) = 2x(n) ; y(-1) = 0
%case:x(n) = u(n)

n = 0:60;
b = [2];
a = [1 0.9];
x = ones(length(n), 1);
y = filter(b, a, x);
figure
stem(n, [x y], 'fill');
xlabel('n')
title('Subproblem (b)');
legend('x(n)', 'y(n)');