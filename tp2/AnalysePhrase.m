clear all; close all; clc;

[x,fs]=audioread("phrase.au");
Taille = length(x);
ts = 1/fs;
T = (0:Taille-1)*ts;

subplot(1,2,1)
plot(T,x);
legend("Signal representation");
xlabel("t");
ylabel("x(t)");

% Play the phrase at double and half the sample rate
sound(x,2*fs);
sound(x,fs/2);

% Signal spectrum
y=fft(x);
Densite_spectrale_phrase = abs(y).^2/Taille;
f = (0:floor(Taille/2))*(fs/Taille);
subplot(1,2,2)
plot(f,Densite_spectrale_phrase(1:floor(Taille/2)+1));
legend("Signal spectrum");
xlabel("Frequency (Hz)");
ylabel("Power Spectral Density");

% Segmentation and rearrangement
seg1 = x(1:130106);
seg2=x(130107:190006);
seg3=x(190007:250006);
seg4=x(250007:394240);
sound([seg1;seg4;seg3;seg2],fs);