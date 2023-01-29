# Représentation temporelle et fréquentielle

Le code tp1.m est un script Matlab qui simule un signal x et son bruit, puis montre leur représentation temporelle et fréquentielle.

  • 1 •Déclaration des variables:
    Les variables fe, te, N, et t sont définies pour déterminer la fréquence d'échantillonnage (1e4 Hz), le temps d'échantillonnage (1/fe), le nombre de points de données (N = 10000) et le vecteur de temps correspondant (t).
    
    '''
    fe = 1e4 ; 
    te  = 1/fe; 
    N = 10000;
    t = (0:N-1)*te
    '''

  • 2 • Génération du signal x:
    Le signal x est généré en utilisant la somme de plusieurs sinusoïdes de différentes fréquences (440 Hz, 550 Hz, 2500 Hz) avec des amplitudes et des décalages différents (1.2 et 3).
    
    '''
    x = 1.2*cos(2*pi*440*t + 1.2) + 3*cos(2*pi*550*t)+ 0.6*cos(2*pi*2500*t);
    '''

   • 3 •Représentation temporelle du signal x:
    La représentation temporelle du signal x est affichée dans le premier sous-graphique en utilisant la fonction plot avec les arguments t et x. Les titres et     les étiquettes des axes sont également définis.
    
    '''
    plot(t,x,'.')
    title('Représentation temporelle du signal x s(t)')
    xlabel('Temps'); 
    ylabel('Amplitudes'); 
    '''

   • 4 •Représentation fréquentielle du signal x:
   La représentation fréquentielle du signal x est obtenue en utilisant la fonction de transformée de Fourier rapide (FFT) et affichée dans le deuxième sous-       graphique en utilisant la fonction plot avec les arguments fshift et fftshift (2 * abs (y) / N).
    
    '''
    fshift = (-N/2:N/2-1)*(fe/N);
    y = fft(x);
    plot(fshift,fftshift(2*abs(y)/N));
    grid
    '''
    
   • 5 •Génération du bruit:
   
    '''
    noise = 2*randn(size(x));
    '''
    
   Le signal bruit est généré en utilisant la fonction randn pour générer un signal aléatoire avec une distribution normale centrée sur zéro et une variance de    La représentation temporelle du signal bruit est affichée dans le troisième sous-graphique.

  • 6 • Représentation fréquentielle du bruit:
   La représentation fréquentielle du bruit est obtenue en utilisant la FFT et affichée dans le quatrième sous-graphique.
   
    '''
    j = fft(noise);
    plot(fshift, fftshift(2*abs(j)/N), 'c')
    grid
    '''
   

   Signal x bruité:
    Le signal x bruité est obtenu en ajoutant le signal bruit au signal x. La représentation temporelle du signal x bruité est affichée dans le cinquième sous-graphique.

   • 7  •Représentation fréquentielle du signal x bruité:
   La représentation fréquentielle du signal x bruité est obtenue en utilisant la FFT et affichée dans le sixième sous-graphique.

Le script Matlab génère six graphiques qui montrent la représentation temporelle et fréquentielle du signal x, du bruit et du signal x bruité. Cela permet de visualiser comment le
