%Generez un vector cu  50 de elemente aleatoare cu distributie normala si il retin in variabila "v" 
v=randn(1,10)
%Creez o bucla for, cu 50 de pasi de la 1 la 50 din 1 in 1, in interiorul careia verific daca elementul corespunzator index-ului este negativ, daca este il aafisez.
for index=1:1:10
    if v(index)<0
        v(index)
    end
end
