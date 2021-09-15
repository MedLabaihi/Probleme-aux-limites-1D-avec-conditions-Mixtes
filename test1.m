% Equation diff�rentiel 1D avec conditions Mixtes

Fonctions 
Mixtes

disp("Equation différentiel 1D avec conditions Mixtes");
disp("-u""(x)+cu(x)=f(x) dans ]0,1[ avec u'(0)=c, u(1)=0");
c= input("Donner la condition au bord u'(0) = c : ");
N = input("Donner le nombre de subdivision N >=2 : ");

x = linspace(0,1,N+2)';
uExa = uExaMix1(x,c);
[A,B] = EFMixtes(c,N,@fun1);
uEM = [A\B;0];


clf(); plot(x,uExa,'g',x,uEM,'rx');
legend("Exacte","Eléments finies");
title("-u''(x)+u(x)=f(x) dans ]0,1[ avec u'(0)=u0, u(1)=0");
Er = norm(uExa-uEM,1)/norm(uExa,1);
printf("L''erreur relative Eléments finies = %.3e\n",Er);
