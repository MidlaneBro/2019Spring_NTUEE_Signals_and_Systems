n=[1:100];
fs=10;
Ts=1/fs;
x=cos(2*pi*(n-1)*Ts);
figure(1);
plot(n,x);

L=3;
fc=0.1;
[b,a]=butter(L,fc);
[H,w]=freqz(b,a);
figure(2);
subplot(3,3,1),plot(w,20*log(abs(H)));
subplot(3,3,2),plot(w,phase(H)*180/pi);
y=filter(b,a,x);
subplot(3,3,3),plot(n,y);

L=7;
[b,a]=butter(L,fc);

[H,w]=freqz(b,a);
subplot(3,3,4),plot(w,20*log(abs(H)));
subplot(3,3,5),plot(w,phase(H)*180/pi);
y=filter(b,a,x);
subplot(3,3,6),plot(n,y);

L=3;
fc=0.5;
[b,a]=butter(L,fc);
[H,w]=freqz(b,a);
subplot(3,3,7),plot(w,20*log(abs(H)));
subplot(3,3,8),plot(w,phase(H)*180/pi);
y=filter(b,a,x);
subplot(3,3,9),plot(n,y);