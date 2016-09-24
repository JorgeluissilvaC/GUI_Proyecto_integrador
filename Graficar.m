function Graficar(funcHs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[n,m]=size(funcHs);
[y_y,t_t]=step(funcHs{1,2,1});plot(t_t,y_y,'k');hold on 
for i=3:1:m
    [y_y,t_t]=step(funcHs{1,i,1});
    plot(t_t,y_y);hold on
end

end

