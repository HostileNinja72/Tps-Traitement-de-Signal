clear all
close all
clc


sampleRate = 8192;
timeStep = 1/sampleRate;
t = [0:timeStep:1];
numSamples = length(time);
Do = sin(2*pi*t*262);
Re = sin(2*pi*t*294);
Mi = sin(2*pi*t*330);
Fa = sin(2*pi*t*349);
Sol = sin(2*pi*t*392);
La = sin(2*pi*t*440);
Si = sin(2*pi*t*494);
Do2 = sin(2*pi*t*523);

doremi_scale = [Do,Re,Mi,Fa,Sol,La,Si,Do2,Do2,Si,La,Sol,Fa,Mi,Re,Do];
happy_bday = [Do,Re,Do,Fa,Mi,Mi,Do,Re,Do,Sol,Fa,Fa,Do,Si,La,Sol,Fa,Fa,Mi,La,Sol,Re,Fa,Mi];
one_octave = [Do,Re,Mi,Fa,Sol,La,Si,Do2];

% sound(doremi_scale, sampleRate);
% sound(happy_bday, sampleRate);

signalAnalyzer(one_octave);
spectrogram(one_octave)
numPoints = length(one_octave);
frequencyShift = (-numPoints/2:(numPoints/2)-1)*(sampleRate/numPoints);
spectralData = fft(one_octave);

subplot(2,1,1)
plot(frequencyShift, fftshift(abs(spectralData)));
legend("Octave Spectrum Representation");
xlabel("f");
ylabel("A");

subplot(2,1,2)
spectralDataLog = 20*log(fftshift(abs(spectralData)));
plot(frequencyShift, spectralDataLog);
legend("Octave Spectrum Representation in dB");
xlabel("f");
ylabel("A");
