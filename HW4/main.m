clear all;
p = 10;
u = 0.01;
[x, fs] = audioread('signal_with_noise.wav');
[v, fs] = audioread('reference_noise.wav');
[W,en] = LMSmyFilter(x,v,p,u);
audiowrite('after.wav',en, fs);

%========== plot W
time = 1:length(x);
figure;
plot(time,W); title(['u=' num2str(u)]); xlabel("n"); ylabel("Wn(k)");
%========== compare before with after
figure;
subplot(2,1,1); plot(time/fs,x); xlabel("time(s)"); title("before");
subplot(2,1,2); plot(time/fs,en); xlabel("time(s)"); title("after");
%========== compare u = 0.001,0.01,0.02
[W1,~] = LMSmyFilter(x,v,p,0.001);
[W2,~] = LMSmyFilter(x,v,p,0.01);
[W3,~] = LMSmyFilter(x,v,p,0.02);

W4 = [W1(10,:);W2(10,:);W3(10,:)];
figure; plot(time,W4);
legend('u=0.001', 'u=0.01', 'u=0.02');
%==========