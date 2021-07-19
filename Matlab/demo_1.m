%% Demo
% Sine Wave demo
%% Default Configuration
t_end  = 3;
Fs = 8000;
t = 0:1/Fs:3;
%% Sine Wave configuration
a1 = 0.5; f1 = 450;
a2 = 1.2; f2 = 880;
a3 = 2; f3 = 750;
a4 = 0.8; f4 = 1000;
a5 = 0.7; f5 = 600;

sin1 = a1*sin(2*pi*f1*t);
sin2 = a2*sin(2*pi*f2*t);
sin3 = a3*sin(2*pi*f3*t);
sin4 = a4*sin(2*pi*f4*t);
sin5 = a5*sin(2*pi*f5*t);

mywave  = sin1+sin2+sin3+sin4+sin5;
figure;
plot(t,mywave)
soundsc(mywave,Fs)
%% Mute

filter = ones(size(mywave));
filter(1.5*Fs:2*Fs)  =0;
mute_wave = filter.*mywave;
figure;
plot(t,mute_wave)
soundsc(mute_wave,Fs)

%%


noise = rand(size(mywave));
noise_wave = mute_wave+noise;
figure;
plot(t,noise_wave)
soundsc(noise_wave,Fs)


