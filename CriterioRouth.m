%%Mostrar las ra�ces del sistema
clc
clear all
syms x e k p
epsilon=e;
Coeff=[1 x^2 (x+2) (0.5*x)];
Roots=roots(Coeff);
display('Las ra�ces del sistema son: ')
disp(Roots);
%% Criterio de Routh
%dim=size(Coeff);	%get size of poli		
n=length(Coeff);				%get number of coefficients
m=ceil(n/2);
Mrouth=sym(zeros(n,m));	%initialize symbolic Routh array 

display('Se llena la matriz de ceros')
disp(Mrouth)

% for i=1:n,
% 	Mrouth(2-rem(i,2),ceil(i/2))= Coeff(i); %assemble 1st and 2nd rows
% end
j=1;
 for i=1:2:n
    Mrouth(1,j)=Coeff(i);
    j=j+1;
 end
j=1; 
for i=2:2:n
    Mrouth(2,j)=Coeff(i);
    j=j+1;
end
display('Se llenan las 2 primeras filas')
disp(Mrouth)

rows=n-2;		%number of rows that need determinants
index=zeros(rows,1);	%initialize columns-per-row index vector

for i=1:rows,
	index(rows-i+1)=ceil(i/2); %form index vector from bottom to top
end

for i=3:n,				%go from 3rd row to last
	if(all(Mrouth(i-1,:)==0)),		%row of zeros
			fprintf('\nSpecial Case: Row of zeros detected.');
			orden=n-i+2;		%order of auxiliary equation
			naux=ceil(orden/2)-rem(orden,2)+1; %number of auxiliary coefficients
			PolAux=Mrouth(i-2,1:naux);	%get auxiliary polynomial
			Paux=orden:-2:0;		%auxiliry polynomial powers
			Mrouth(i-1,1:naux)=PolAux.*Paux;	%derivative of auxiliary
	elseif(Mrouth(i-1,1)==0),		%first element in row is zero
			fprintf('\nSpecial Case: First element is zero.');
			Mrouth(i-1,1)=epsilon;	%replace by epsilon
	end
				%compute the Routh array elements
           
	for j=1:index(i-2),	
		Mrouth(i,j)=-det([Mrouth(i-2,1) Mrouth(i-2,j+1);Mrouth(i-1,1) Mrouth(i-1,j+1)])/Mrouth(i-1,1);
	end
end
disp(Mrouth);
[f m o]=size(Mrouth);
R=Mrouth;
ele=' ';
for i=1:length(R)
  el=strcat(',(',char(R(i,1)),')>0');
  ele=strcat(ele,el);
end
solve(ele(2:end),x)