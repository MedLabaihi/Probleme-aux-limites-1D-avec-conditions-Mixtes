%{
******************************************************
  Probleme aux limites 1D avec conditions Mixtes
  Etude complete
*******************************************************
%}

Fonctions 
Mixtes

disp("Equation différentiel 1D avec conditions Mixtes");
disp("-u""(x)+u(x)=f(x) dans ]0,1[ avec u'(0)=c, u(1)=0");
c= input("Donner la condition au bord u'(0) = c : ");
N = input("Donner le nombre de subdivision N >=2 : ");
Nf=input("choisir un exemple : 1 ou 2 : ","s")

x = linspace(0,1,N+2)';
if Nf=='1'
  uExa = uExaMix1(x,c); g=@fun1;
else
  uExa = uExaMix2(x,c); g=@fun2;
end

[A,B] = EFMixtes(c,N,g);
uEF = [A\B;0];

[Ad,Bd]=DFMixtes(c,N,g);
uDF=[Ad\Bd;0];
clf(); 
plot(x,uExa,'r',x,uDF,'bx',x,uEF,'g*');
legend("Exacte","Diff. Finies","Eléments finies","location","south");
title("-u''(x)+u(x)=f(x) dans ]0,1[ avec u'(0)=u0, u(1)=0","fontsize",13);

ErEF = norm(uExa-uEF,1)/norm(uExa,1);
ErDF = norm(uExa-uDF,1)/norm(uExa,1);
printf("L''erreur relative elem finies en norme 1 = %.3e\n",ErEF);
printf("L''erreur relative Diff. finies en norme 1 = %.3e\n",ErDF);
#========================================================================


#========================================================================
input("Continuer ? ","s");
input("Etude de l''ordre, tapez Entree ","s");
printf("\nOrdre pour Norme inf ou 1\n");
printf("============================\n");
printf("N\tElem. Finis\tDiff. Finies\n");
printf("=====================================\n");
N=1; h1=1/(N+1); ErrEF1=1; ErrDF1=1;
for k=1:10
  N=2*N; h2=1/(N+1);
  x = linspace(0,1,N+2)';
  if Nf=='1' 
    uExa = uExaMix1(x,c);
  else uExa = uExaMix2(x,c);
  endif

  [A,B]=EFMixtes(c,N,g); [Ad,Bd]=DFMixtes(c,N,g);
  uEF=[A\B;0]; uDF=[Ad\Bd;0];
  
  ErrEF2 = norm(uExa-uEF,'inf'); ErrDF2 = norm(uExa-uDF,'inf'); 
  hh=log(h2/h1);
  Ce=log(ErrEF2/ErrEF1)/hh; Cd=log(ErrDF2/ErrDF1)/hh;
  h1=h2; ErrEF1=ErrEF2; ErrDF1=ErrDF2;
  printf("%d\t%.3f\t\t%.3f\n",N,Ce,Cd);
endfor

