clear all ; 
close all  ;
clc;

fe = 1e4 ; 
te  = 1/fe; 
N = 10000;
t = (0:N-1)*te;

x = 1.2*cos(2*pi*440*t + 1.2) + 3*cos(2*pi*550*t)+ 0.6*cos(2*pi*2500*t);
subplot(3,2,1)
plot(t,x,'.')
title('Représentation temporelle du signal x s(t)')
xlabel('Temps'); 
ylabel('Amplitudes'); 

subplot(3,2,2)
fshift = (-N/2:N/2-1)*(fe/N);
y = fft(x);
plot(fshift,fftshift(2*abs(y)/N));
grid
title('Représentation frequentielle du signal')
xlabel('Frequencies'); 
ylabel('Amplitudes');

subplot(3,2,3)
noise = 2*randn(size(x));
plot(t, noise,'c')
grid 
title('Signal bruit')
xlabel("Temps");
ylabel("Amplitudes");

subplot(3, 2, 4)
j = fft(noise);
plot(fshift, fftshift(2*abs(j)/N), 'c')
grid
title("Représentation frequentielle du signal bruit")
xlabel("Frequencies");
ylabel("Amplitudes");


subplot(3,2,5)
xnoise = x+noise;
plot(t,xnoise,'.')
grid
title('Signal x bruité s')
xlabel('Temps') ; 
ylabel('Amplitudes'); 

subplot(3,2,6)
i = fft(xnoise); 
plot(fshift,fftshift(2*abs(i)/N),'c')
grid
title('Représentation frequentielle du signal x bruité TF(sb)')
xlabel('Frequencies'); 
ylabel('Amplitudes'); 










