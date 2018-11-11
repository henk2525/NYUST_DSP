clear all;

InFile = 'original.wav';
N = 256;
HalfN = N/2;
QuarterN = N/4;

[x, fs] = audioread(InFile);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N * FN - Lx;
x = [x; zeros(nz, 1)];
x_scrb = zeros(Lx+ nz, 1);

for k = 1: FN
    s = x((k- 1)*N+1 : k*N);
    Fs = fft(s);

    
    swap_Fs = [Fs(QuarterN+1:HalfN);
               Fs(1:QuarterN);
               Fs(HalfN+QuarterN+1:N);
               Fs(HalfN+1:HalfN+QuarterN)];
      
    conj_swap_Fs = conj(swap_Fs);
            
    
    conj_swap_s = ifft(conj_swap_Fs);
    x_scrb((k- 1)*N+1 : k*N) = real(conj_swap_s);
end

audiowrite('scramble.wav', x_scrb, fs);