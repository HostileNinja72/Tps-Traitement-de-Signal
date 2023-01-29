clear;
close all;
clc;

fe = 1e4;
te = 1/fe;
N = 5000;
t = (0:N-1)*te;
x = 1.2*cos(2*pi*440*t + 1.2) + 3*cos(2*pi*550*t) + 0.6*cos(2*pi*2500*t);
x1 = 1.2*cos(2*pi*440*t + 1.2) + 3*cos(2*pi*550*t);
f = (0:N-1)*(fe/N);
y = fft(x);
fshift = (-N/2:N/2-1)*(fe/N);

fc = 2000;
pass_bas = zeros(size(x));
index_fc = ceil((fc*N)/fe);
pass_bas(1:index_fc) = 1;
pass_bas(N-index_fc+1:N) = 1;

x_filtre_freq = pass_bas .* y;
x_filtre_temp = ifft(x_filtre_freq, "symmetric");

subplot(2,3,1);
plot(t,x,"Linewidth",1.5);
legend("Orig signal");
xlabel("t");
ylabel("x(t)");

subplot(2,3,2);
plot(fshift,fftshift(abs(y)));
legend("Orig signal spectrum");
xlabel("f");
ylabel("A");

subplot(2,3,3);
plot(f,pass_bas,"Linewidth",1.5);
legend("Low-pass filter");
xlabel("f");
ylabel("Filter");

subplot(2,3,4);
plot(t,x_filtre_temp);
xlabel("t");
ylabel("Filtered signal");
legend("Filtered signal");

subplot(2,3,5);
plot(fshift,fftshift(abs(fft(x_filtre_temp))));
xlabel("f");
ylabel("A");
legend("Filtered signal spectrum");

subplot(2,3,6);
plot(t,x1-x_filtre_temp);
legend("Difference between filtered signal and signal without cosine of frequency 2500");
xlabel("t");
ylabel("Difference");