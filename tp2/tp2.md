# Jeux de mots

• 1 • le signal audio est lu à l'aide de la fonction audioread et les variables x, 
fs (taux d'échantillonnage), Taille, ts (durée d'échantillonnage) et T (vecteur temps) sont définies.

    '''
    [x,fs] = audioread("phrase.au");
    Taille = length(x);
    ts = 1/fs;
    T = (0:Taille-1)*ts;
    '''
 • 2 • Le premier sous-plot affiche la représentation temporelle du signal audio en utilisant la fonction plot
 
    '''
    subplot(1,2,1)
    plot(T,x);
    legend("Signal representation");
    xlabel("t");
    ylabel("x(t)");
    '''
• 3 • Le signal audio est joué à des taux d'échantillonnage différents avec la fonction sound pour montrer comment cela peut affecter la qualité `sonore`

    '''
    % Play the phrase at double and half the sample rate
    sound(x,2*fs);
    sound(x,fs/2);
    '''
  
• 4 • La fonction `fft` est utilisée pour trouver la transformée de Fourier du signal audio. 
 La densité spectrale de puissance est alors déterminée à l'aide de `Densité_spectrale_phrase`.
  
    '''
    % Signal spectrum
    y=fft(x);
    Densité_spectrale_phrase = abs(y).^2/Taille;
    f = (0:floor(Taille/2))*(fs/Taille);
    '''
    
• 5 • Le deuxième sous-plot affiche la représentation fréquentielle du signal en utilisant la fonction `plot`
     
     '''
    subplot(1,2,2)
    plot(f,Densité_spectrale_phrase(1:floor(Taille/2)+1));
    legend("Signal spectrum");
    xlabel("Frequency (Hz)");
    ylabel("Power Spectral Density");
     '''
     
 • 6 • Enfin, le signal est segmenté en 4 parties différentes en définissant des variables seg1, seg2, seg3 et seg4.
 Le signal segmenté est alors joué dans un ordre différent avec la fonction `sound`.
 
      '''
      % Segmentation and rearrangement
      seg1 = x(1:130106);
      seg2=x(130107:190006);
      seg3=x(190007:250006);
      seg4=x(250007:394240);
      sound([seg1;seg4;seg3;seg2],fs);
      '''
      
      
 #Synthèse et analyse spectrale d’une gamme de musique
 
 • 1 • Initialisation:

   La fréquence d'échantillonnage est définie sur 8192 Hz.
   Le pas de temps est défini en conséquence en utilisant la fréquence d'échantillonnage.
   Le vecteur temps est créé en utilisant le pas de temps.
   Les fréquences des notes de musique (Do, Re, Mi, Fa, Sol, La, Si, Do2) sont générées en utilisant la fonction sinus avec leur fréquence respective.
   Trois signaux musicaux différents sont créés en utilisant les notes précédentes: doremi_scale, happy_bday et one_octave.
   
    '''
    sampleRate = 8192;
    timeStep = 1/sampleRate;
    t = [0:timeStep:1];
    numSamples = length(time);
    Do = sin(2*pi*t*262);
    Re = sin(2*pi*t*294);
    Me = sin(2*pi*t*330);
    Fa = sin(2*pi*t*349);
    So = sin(2*pi*t*392);
    La = sin(2*pi*t*440);
    Si = sin(2*pi*t*494);
    Do2 = sin(2*pi*t*523);

    doremi_scale = [Do,Re,Mi,Fa,Sol,La,Si,Do2,Do2,Si,La,Sol,Fa,Mi,Re,Do];
    happy_bday = [Do,Re,Do,Fa,Mi,Mi,Do,Re,Do,Sol,Fa,Fa,Do,Si,La,Sol,Fa,Fa,Mi,La,Sol,Re,Fa,Mi];
    one_octave = [Do,Re,Mi,Fa,Sol,La,Si,Do2];
    '''
    
  • 2 • Analyse:

   La fonction signalAnalyzer est appelée sur one_octave.
   La spectrogramme de one_octave est générée.
   La transformation de Fourier (FFT) de one_octave est effectuée.
   La fréquence de décalage est déterminée en utilisant la longueur du signal et la fréquence d'échantillonnage.
   Les données spectrales sont déterminées en utilisant la FFT.
   
    '''
    signalAnalyzer(one_octave);
    spectrogram(one_octave)
    numPoints = length(one_octave);
    frequencyShift = (-numPoints/2:(numPoints/2)-1)*(sampleRate/numPoints);
    spectralData = fft(one_octave);
    '''
   
  • 3 • Affichage:

   Les données spectrales sont affichées en utilisant la fonction plot.
   La représentation en dB des données spectrales est également affichée en utilisant la fonction plot.
   Les axes des abscisses et ordonnées sont étiquetés en conséquence et des légendes sont ajoutées pour les deux graphiques.
   
    '''
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
    '''
 
 
