# Filtrage et diagramme de Bode

1 • 2 • Definiton de Signal, Son tracage, et son Transforme de Fourier.

    '''
  
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
    
    '''
 3 • Transmitance complexe
 
    '''
    
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
      
    '''
    
   # Dé-bruitage d'un signal sonore
   Lecture du fichier audio: Le fichier audio est lu à l'aide de la fonction audioread et stocké dans le vecteur original_signal avec un taux d'échantillonnage fs.

   Calcul de la longueur du signal et de la fréquence d'échantillonnage: La longueur du signal est obtenue en utilisant la fonction length et est stockée dans la variable N. La fréquence d'échantillonnage est divisée par la longueur du signal pour obtenir les fréquences associées à chaque coefficient de Fourier.

   Transformation de Fourier du signal d'origine: La transformation de Fourier du signal d'origine est effectuée à l'aide de la fonction fft et est stockée dans la variable spectrum_orig_signal.

   Tracé du spectre du signal d'origine: Le spectre du signal d'origine est tracé à l'aide de la fonction plot avec les fréquences sur l'axe des x et les amplitudes sur l'axe des y.

   Définition de la fonction de transfert du filtre: La fonction de transfert du filtre est définie en utilisant la fréquence de coupure fc et un coefficient K. La fonction de transfert est une fonction de filtre passe-bas.

   Calcul du spectre filtré: Le spectre filtré est obtenu en multipliant le spectre d'origine par la fonction de transfert.

   Transformation de Fourier inverse: Le signal filtré est obtenu à l'aide de la transformation de Fourier inverse en utilisant la fonction ifft et en spécifiant que le signal doit être symétrique.

   Tracé du spectre filtré: Le spectre filtré est tracé à l'aide de la fonction plot avec les fréquences sur l'axe des x et les amplitudes sur l'axe des y.

   Tracé de la fonction de transfert du filtre: La fonction de transfert du filtre est tracée en utilisant la fonction semilogx avec les fréquences sur l'axe des x et la magnitude sur l'axe des y.
   
  
   
    
    
