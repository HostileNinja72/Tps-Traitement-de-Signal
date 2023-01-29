clear all;
close all;
clc;

[original_signal,fs]=audioread('test.wav');
original_signal = original_signal';

N = length(original_signal);
f = (0:N-1)(fs/N);
fshift =(-N/2:(N/2)-1)(fs/N);

spectrum_orig_signal = fft(original_signal);

figure(1)
plot(fshift,fftshift(abs(spectrum_orig_signal)));
legend("Spectrum of original signal");
xlabel("f");
ylabel("A");

fc = 5000;
K = 1;

H = K./(1+1i*(f/fc).^100);
Hpass=[H(1:floor(N/2)),flip(H(1:floor(N/2)))];

filtered_spectrum = spectrum_orig_signal(1:end-1).*Hpass;
filtered_signal = ifft(filtered_spectrum,"symmetric");

figure(2)
semilogx(f(1:floor(N/2)),abs(H(1:floor(N/2))),'linewidth',1.5)
legend("Magnitude of complex transfer function");
xlabel("f");
ylabel("|H(jw)|");

figure(3)
plot(fshift(1:end-1),fftshift(abs(fft(filtered_signal))))
legend("Spectrum of filtered signal");
xlabel("f");
ylabel("A");