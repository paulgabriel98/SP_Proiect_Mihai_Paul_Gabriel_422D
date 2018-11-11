clear all
%Creez o bucla for in care generez un vector cu elemente complexe aleatorii. 
for index=1:10
    l=randn;
    k=randn;
    %Daca partea imaginara este 0 va aparea doar partea reala nu si 0*i.
    if k==0
        v(index)=l;
    else
        v(index)=l + k*i;
    end
end
%Afisez v.
v
%Apelez functia EX3 si ii dau ca parametru vectorul v,creat anterior.
EX3(v)

