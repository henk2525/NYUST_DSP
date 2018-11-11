clear all;

InFile = 'scramble2.wav';
N = 256;
HalfN = N/2;

[x, fs] = audioread(InFile);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N* FN- Lx;
x = [x; zeros(nz, 1)];
x_scrb = zeros(Lx+ nz, 1);
swap_Fs = zeros(HalfN,1);

for k = 1: FN
    s = x((k- 1)*N+1 : k*N);
    Fs = fft(s);

    for i = 1 : 32
        swap_Fs((i-1)*4+1:i*4) = Fs(i:32:HalfN);
    end
    
    Swap_Fs = [swap_Fs;0;real(swap_Fs(HalfN:-1:2))-1i*imag(swap_Fs(HalfN:-1:2))];
    
    Swap_s = ifft(Swap_Fs);
    x_scrb((k- 1)*N+1 : k*N) = Swap_s;
end

audiowrite('inv_scramble2.wav', x_scrb, fs);