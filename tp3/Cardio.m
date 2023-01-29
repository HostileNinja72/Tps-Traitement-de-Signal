clear all
close all
clc

load("ecg.mat");
L=length(ecg);
Fe=500;
t = (0:L-1)/Fe; 
figure (1)
plot(t,ecg);
title('Représentation temporelle du signal x s(t)')
xlabel('Temps'); 
label('Amplitudes'); 
y = fft(ecg);
fshift = (-L/2:L/2-1)*(Fe/L);
figure (2)
spectre_x=fftshift(2*abs(y)/L);
plot(fshift,fftshift(2*abs(y)/L));
title('Représentation frequentielle du signal')
xlabel('Frequencies'); 
ylabel('Amplitudes');

pass_haut_ideal = ones(size(ecg));
fc = 0.5;
indexe_fc = ceil((fc*L)/Fe);
pass_haut_ideal(1:indexe_fc)=0;
pass_haut_ideal(L-indexe_fc+1:L)=0;


f=(0:L-1)*(Fe/L);
figure (3)
plot(f,pass_haut_ideal,'linewidth',1.2);
 
spectre_x_filtree = pass_haut_ideal .* y ;
tmp_x_filre = ifft(spectre_x_filtree,'symmetric');

plot(t,tmp_x_filre)
hold on
plot(t,ecg+3)
hold on
plot(t,ecg-tmp_x_filre+1.5)


 
fshift=(-L/2:L/2-1)*(Fe/L);
% % 
figure(4)
plot(fshift,fftshift(abs(fft(tmp_x_filre))));
