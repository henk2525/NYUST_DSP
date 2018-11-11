%system model: y(n) + 0.9y(n-1) = 2x(n) ; y(-1) = 0
%case:x(n) = 1,1,0,0,1,1,0,0,1,1,0,0,......


n = 0:59;
b = [2];
a = [1 0.9];
x = repmat([1 1 0 0], 1, 15).';
y = filter(b, a, x);
figure
stem(n, [x y], 'fill');
xlabel('n')
title('Subproblem (c)');
legend('x(n)', 'y(n)');