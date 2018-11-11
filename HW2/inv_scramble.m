clear all;

InFile = 'scramble.wav';
N = 256;
HalfN = N/2;
QuarterN = N/4;

[x, fs] = audioread(InFile);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N* FN- Lx;
x = [x; zeros(nz, 1)];
x_scrb = zeros(Lx+ nz, 1);

for k = 1: FN
    s = x((k- 1)*N+1 : k*N);
    Fs = fft(s);

    conj_Fs = conj(Fs);
    swap_conj_Fs = [conj_Fs(QuarterN+1:HalfN);
                    conj_Fs(1:QuarterN);
                    conj_Fs(HalfN+QuarterN+1:N);
                    conj_Fs(HalfN+1:HalfN+QuarterN)];
            
    swap_conj_s = ifft(swap_conj_Fs);
    x_scrb((k- 1)*N+1 : k*N) = real(swap_conj_s);
end

audiowrite('inv_scramble.wav', x_scrb, fs);