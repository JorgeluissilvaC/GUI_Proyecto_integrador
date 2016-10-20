clear all ; clc ; close all 
%% Señales 
% escalon
zz(1:199)=0;
zz(200:1000)=1;
t=linspace(0,2,1000);
plot(t,zz)
figure
% impulse 
%%
imp(1:1000)=0;
imp(200)=1;
t=linspace(0,2,1000);
plot(t,imp)
%% Respuesta a la Rampa con entrada
figure
u_t=t;
plot(t,u_t)
title('Respuesta a la rampa')

%% Respuesta a la parabola con entrada
figure
r_p=t.^2/2;
plot(t,r_p)
title('Respuesta a parábola')