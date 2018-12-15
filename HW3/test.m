fs=8000;			% Sampling rate
allH=[];
cutOffFreq=[1000 2000];

for filterOrder=1:8;
	[b, a]=butter(filterOrder, cutOffFreq/(fs/2), 'stop');
	% === Plot frequency response
	[h, w]=freqz(b, a);
	allH=[allH, h];
end

plot(w/pi*fs/2, 20*log10(abs(allH)),'-'); grid on;
title('Frequency response of a bandstop Butterworth filter');xlabel('Frequency (Hz)'); ylabel('(dB)');
legend('order=1', 'order=2', 'order=3', 'order=4', 'order=5', 'order=6', 'order=7', 'order=8');