%% Calculo error
Gm2=tf(1,[1 1 1]);
syms s
syms x
escalon=1/s;
rampa=1/s^2;
parabola=1/s^3;
impulso=1;
%en el tiempo
escalonx=1;
rampax=x;
parabolax=x^2/2;
impulsox=dirac(x);
[num,den]=tfdata(Gm2,'v');
nume=poly2sym(num,s);
deno=poly2sym(den,s);
c_t=ilaplace((nume/deno)*1/s,s,x);
e_esc=abs(limit(escalonx-c_t,x,inf));
c_t=ilaplace((nume/deno)*rampa,s,x);
e_ramp=abs(limit(rampax-c_t,x,inf));
c_t=ilaplace((nume/deno)*parabola,s,x);
e_par=abs(limit(parabolax-c_t,x,inf));
c_t=ilaplace((nume/deno)*impulso,s,x);
e_imp=abs(limit(impulsox-c_t,x,inf));
sym2poly(e_imp)