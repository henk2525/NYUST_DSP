clear all;

InFile = 'test1c_8k_hum.wav';
[x, fs] = audioread(InFile);
Wp = [40 80]/(fs/2);
Ws = [55 65]/(fs/2);
Rp = 3;
Rs = 40;

[~,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(2,Wn,'stop');

out = myFilter(b,a,x);
%out = filter(b,a,x);
out_scaled = out/max(abs(out));
audiowrite('Butterworth.wav',out_scaled, fs);
disp('Job Finished!');

% ================== Plotting
N = 4096;                  % Fourier points
X_f=fs*(0:N/2-1)/N;
[h,f] = freqz(b,a,N,fs); % Frequency response of digital filter
X = fft(x(1:N));
Fout_scaled = fft(out_scaled(1:N));
time = (1:length(x))/fs;
subplot(2,2,1); plot(time, x); xlabel('Time (s)'); title('Before');
subplot(2,2,2); plot(time, out_scaled); xlabel('Time (s)'); title('After');
subplot(2,2,3); plot(f(1:120), 20*log10(abs(h(1:120)))); 
                xlabel('Frequency (Hz)'); ylabel('(dB)'); title('filter');
subplot(2,2,4); plot(X_f(1:60),2*abs(X(1:60))/length(N),... 
                     X_f(1:60),2*abs(Fout_scaled(1:60))/length(N));
                title('compare before with after in Frequency-Domain')
                grid on; xlabel('Frequency (Hz)'); legend('In','Out'); 
% ==================
