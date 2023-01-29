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
 
