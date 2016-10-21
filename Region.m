clear all; close all; clc 
syms  k p 
f=k<p;
q=[-2,-3];p=[3,3];ps=0.1;
n=[0 q(2):ps:p(2) 0];lm=length(n);%Filas 
m=[0 q(1):ps:p(1) 0];ln=length(m);%Columnas
se=zeros(lm,ln);
se(:,1)=fliplr(n);se(1,:)=fliplr(m');
for i=2:1:lm-1        %Filas 
    for  j=2:1:ln-1   %Columnas 
           k=se(1,j);
           p =se(i,1);
        if p^2 + p > k
            if k > 0  
                if p > -1
                    plot(se(1,j),se(i,1),'*k')
                    se(i,j)=1;
                    hold on 
                end
            end
        end 
        
    end
end