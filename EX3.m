function [media,v_patrat,matrice]=EX3(v)
media=mean(real(v))
for index=1:length(v)
    v_patrat(index)=v(index)*v(index);
end
v_patrat
matrice=v*v'
    
