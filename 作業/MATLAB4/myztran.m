b0=0.0976;
b1=[1 -1];
b2=[1 1];
a1=[1 -0.3575-0.5889j];
a2=[1 -0.3575+0.5889j];
a3=[1 -0.7686-0.3338j];
a4=[1 -0.7686+0.3338j];
b=b0*conv(conv(b1,b2),conv(b1,b2));
a=conv(conv(conv(a1,a2),a3),a4);
[r,p,k]=residuez(b,a);
n=[0:100];
h=r(1)*p(1).^n+r(2)*p(2).^n+r(3)*p(3).^n+r(4)*p(4).^n;
h(1)=h(1)+k;
subplot(4,2,1),stem(n,h);
subplot(4,2,2),zplane(b,a);

[H,w]=freqz(b,a,1024);
subplot(4,2,3),plot(w,abs(H));
subplot(4,2,4),plot(w,angle(H));

z=[1,1,-1,-1];
p=[0.3575+0.5889j,0.3575-0.5889j,0.7686+0.3338j,0.7686-0.3338j];
k=0.0976;
[sos,g]=zp2sos(z,p,k);

b1=[sos(1,3),sos(1,2),sos(1,1)];
a1=[sos(1,6),sos(1,5),sos(1,4)];
b2=[sos(2,3),sos(2,2),sos(2,1)];
a2=[sos(2,6),sos(2,5),sos(2,4)];
[H1,w]=freqz(b1,a1,1024);
[H2,w]=freqz(b2,a2,1024);
subplot(4,2,5),plot(w,abs(H1));
subplot(4,2,6),plot(w,abs(H2));
subplot(4,2,7),plot(w,abs(H1).*abs(H2));

x=linspace(0,0,101);
x(1)=1;
y=filter(b,a,x);
subplot(4,2,8),stem(n,y);