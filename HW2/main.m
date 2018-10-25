clear all;

InFile = 'ADSP_test_signal_for_project2.wav';
N = 256;
HalfN = N/2;

[x, fs] = audioread(InFile);
%x = xin(:,1);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N* FN- Lx;
x = [x; zeros(nz, 1)];

x_descrb = zeros(Lx+ nz, 1);
for k = 1: FN
    s = x((k- 1)*N+1 : k*N);
    Fs = fft(s);
    swap_Fs = [ Fs(HalfN+1 : N) ; Fs(1 : HalfN)];
    swap_s = ifft(swap_Fs);
    x_descrb((k- 1)*N+1 : k*N) = swap_s;
end

audiowrite('new_signal.wav', x_descrb, fs);