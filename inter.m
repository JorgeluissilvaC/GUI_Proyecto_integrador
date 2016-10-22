clear all; close all ;clc 
syms k p
R=[1;(k+1);(2+p+k); p + k];
%Subs k
n1=sym(zeros(length(R),1));n2=sym(zeros(length(R),1));
l1=0;l2=0;
for i=1:length(R)
   nw=sym2poly(subs(R(i,1),k,1));
   disp(nw)
   if length(nw)==1
       l1=l1 +1;
       n1(l1,1)=R(i,1);
       
   else
       l2=l2+1;
       n2(l2,1)=R(i,1);
       
   end
end

%%
ele=' ';
for i=1:l1
  el=strcat(',(',char(n1(i,1)),')>0');
  ele=strcat(ele,el);
end
solve(ele(2:end),k)
%%
clear ele el
ele1=' ';
for i=1:l2
  el1=strcat(',(',char(n2(i,1)),')>0');
  ele1=strcat(ele1,el1);
end
solve(ele1(2:end),k)

%%
clear se1
q=[-3,-3];v=[1,5];ps=1;
n=[q(2):ps:v(2) 0];ln=length(n);%Filas 
m=[q(1):ps:v(1) 0];lm=length(m);%Columnas
se1=zeros(lm,ln,size(R,1));
se1(:,1,1)=fliplr(m);se1(1,:,1)=fliplr(n');
%se1=se1(1:end-1,1:end-1,:);
ji=0;
%%
for i=2:1:lm-1        %Filas
    for  j=2:1:ln-1   %Colum
        pp=se1(1,j,1);
        kk =se1(i,1,1);
        
        for ji=1:size(R,1);
            con1=subs(R(ji),p,pp);
        if (subs(con1,k,kk)>0)
           se1(i,j,ji)=1 ;
        end
        end 
    end
end

