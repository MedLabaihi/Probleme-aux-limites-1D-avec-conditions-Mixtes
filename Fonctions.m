# Equation différentiel 1D: -u"(t)+u(t)=f(t) in ]0,1[
# avec conditions mixtes u'(0)=c et u(1)=0
1;
function [y]=fun1(x,c)
    y = -x+1;
endfunction

function [y]=uExaMix1(x,c)
  k1=(c+1)/(exp(1)**2+1); k2=-exp(1)**2*(c+1)/(exp(1)**2+1);
    y = k1*exp(x)+k2*exp(-x)-x+1;
endfunction

function y=fun2(x)
  y=sin(x);
endfunction


function y=uExaMix2(x,c)
  D=2*(exp(1)^2+1);
  k1=-(exp(1)*sin(1)-2*c+1)/D;
  k2=-(exp(1)^2*(2*c-1)+exp(1)*sin(1))/D;
  y=k1*exp(x)+k2*exp(-x)+sin(x)/2;
endfunction
