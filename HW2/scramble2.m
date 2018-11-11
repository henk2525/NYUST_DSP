clear all;

InFile = 'original.wav';
N = 256;
HalfN = N/2;

[x, fs] = audioread(InFile);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N * FN - Lx;
x = [x; zeros(nz, 1)];
x_scrb = zeros(Lx+ nz, 1);

for k = 1: FN
    s = x((k- 1)*N+1 : k*N);
    Fs = fft(s);
    
    swap_Fs = [Fs(1:4:HalfN);
               Fs(2:4:HalfN);
               Fs(3:4:HalfN);
               Fs(4:4:HalfN)];
    Swap_Fs = [ swap_Fs ;0;real(swap_Fs(HalfN:-1:2))-1i*imag(swap_Fs(HalfN:-1:2))];
    
    Swap_Fs = ifft(Swap_Fs);
    x_scrb((k- 1)*N+1 : k*N) = Swap_Fs;
end

audiowrite('scramble2.wav', x_scrb, fs);