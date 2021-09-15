# Equation différentiel 1D avec Conditions Mixtes
# -u"(x)+u(x)=f(x) dans ]0,1[ avec u'(0)=c, u(1)=0
1;



# par Elements Finis : 
#=====================

function [A,B]=EFMixtes(c,N,f)
    h = 1/(N+1);
    A0 = diag([1;2*ones(N,1)])/h+h*diag([1/3;2/3*ones(N,1)]);
    A1=(h/6-1/h)*(diag(ones(N,1),1)+diag(ones(N,1),-1));
    A = A0 + A1;
    B = f([0:h:1-h]',c)*h;
    B(1) = -c + h*f(0,c)/2;
endfunction



# par Differences Finies :
#=========================

function [A,B]=DFMixtes(c,N,Fun)
    h = 1/(N+1);
    A = diag([1;(2+h^2)*ones(N,1)]);
    A = A-diag(ones(N,1),1)-diag([ones(N,1)],-1);
    B = [-h*c;Fun([h:h:1-h]')*h^2];
endfunction



###{
##Amelioration de l'ordre  des DF 
##en prenant l'approximation centree
##de u'(0)=u(h)-u(-h))/(2h)
###}
##
#function [A,B]=DFMixtes(c,N,Fun)
#    h = 1/(N+1);
#    A = diag([(2+h^2)*ones(N+1,1)]);
#    A = A-diag([2;ones(N-1,1)],1)-diag([ones(N,1)],-1);
#    B = Fun([0:h:1-h]')*h^2; B(1)=B(1)-2*c*h;
#endfunction


