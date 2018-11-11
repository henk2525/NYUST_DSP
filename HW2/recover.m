clear all;

InFile = 'ADSP_test_signal_for_project2.wav';
N = 256;
HalfN = N/2;

[x, fs] = audioread(InFile);
Lx = length(x);
FN = ceil(Lx/ N);
nz = N* FN- Lx;

x = [x; zeros(nz, 1)];
x_descrb = zeros(Lx+ nz, 1); 

for k = 1: FN
    s = x((k- 1)*N+1 : k*N); % kth frame
    Fs = fft(s); %快速傅立葉轉換
    
    swap_Fs = fftshift(Fs);  %使用fftshift即可做出下一列註解動作
    %swap_Fs = [ Fs(HalfN+1 : N) ; Fs(1 : HalfN)];
    
    swap_s = ifft(swap_Fs);  %傅立葉反轉換
    x_descrb((k- 1)*N+1 : k*N) = swap_s;   %填入新向量
end

audiowrite('original.wav', x_descrb, fs);