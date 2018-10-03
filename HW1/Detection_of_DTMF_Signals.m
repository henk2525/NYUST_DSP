clear all;
InFile = 'DTMF_Signal2.wav';

N = 205;
Len = 7;
Nsig = 800;
Npau = 800;
Ntot = Nsig + Npau;
offset = 100;
[s, fs] = audioread(InFile);

output = zeros(1,Len);
for m = 1:Len
    start = (m-1) * Ntot + offset;
    s1 = s(start:start+N-1);
    Fs1 = fft(s1);
    MFs1 = abs(Fs1);
    %figure; stem(MFs1(1:round(N/2)),'filled');
    [KL KH] = findk(MFs1,N);               %Find low and high band
    output(m) = fk2dig(KL, KH);            %Find dig by low and high band
end
output = char(output);
disp('The number are');
disp(output);


