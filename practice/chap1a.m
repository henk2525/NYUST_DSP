% x(n) = 3sin(0.6*pi*n) , n = 0, ..., 120

n = 0:120;
x = 3 * sin(0.6*pi*n);
stem(n, x, 'fill');
