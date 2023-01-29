clear all
close all
clc

Te = 0.0005;
Fe=1/Te;
f1=500;
f2=400;
f3=50;


t = 0:Te:5-Te;
N = length(t);

x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
subplot(2, 1, 1)
plot(t, x)
subplot(2, 1, 2)
f = (0:N-1)*(Fe/N);
fshift = (-N/2:N/2 - 1)*(Fe/N);
y = fft(x);
plot(fshift,fftshift(2*abs(y)/N))

figure(2)
subplot(2,2,1)
K = 1;
wc = 50;
w = f;
H = (K*1j*(w/wc))./(1 + 1j*(w/wc));
plot(abs(H));

subplot(2, 2, 2)
hold on
wc = 10;
H1 = (K*1j*(w/wc))./(1 + 1j*(w/wc));
semilogx(w, 20*log(abs(H1)));
wc = 50;
H2 = (K*1j*(w/wc))./(1 + 1j*(w/wc));
semilogx(w, 20*log(abs(H2)));
wc = 100;
H3 = (K*1j*(w/wc))./(1 + 1j*(w/wc));
semilogx(w, 20*log(abs(H3)));
hold off

subplot(2, 2, 3)

filterH3 = [H(1:floor(N/2)), flip(H(1:floor(N/2)))];
s = y .* filterH3;
S = ifft(s, "symmetric");
plot(fshift, fftshift(2*abs(fft(S))/N))



