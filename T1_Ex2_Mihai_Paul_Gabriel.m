rez_temp = 0.002;
%Punctul de incepere al reprezentarii(de pe axa orizontala).
BEGIN=-4;
%Punctul de incheiere al reprezentarii(de pe axa orizontala).
END=6;
%Generez un vector numit y de la BEGIN la END cu pasul rezolutia temporara.
%El va fi folosit la reprezentarea grafica drept axa Ox.
y =BEGIN:rez_temp:END;
T = 5;
niv_min = -2;
niv_max = 1;
panta_poz = 1;
panta_neg = -1.5;
%Variabila "indice" este folosita pentru a sti cand facem trecerea de la 
%panta pozitiva la cea negativa.
indice = BEGIN + (niv_max - niv_min)*panta_poz;
x = niv_min;
%Variabilele trans_poz si trans_neg (trans-> translatare ; poz->pozitiv;
%neg->negativ) sunt folosite pentru a translata graficul in functie de
%punctul de incepere al reprezentarii(BEGIN);
trans_poz = abs(BEGIN)-2*panta_poz;
trans_neg = (-panta_neg)*BEGIN+5.5;

for i = BEGIN + rez_temp:rez_temp:END
    if i < indice
        %Se adauga in x punctul corespunzator pentru a creea dreapta cu 
        %panta pozitiva
        x = [x, panta_poz*i+trans_poz];
    elseif i < -2 + T + indice
        %Se adauga in x punctul corespunzator pentru a creea dreapta cu 
        %panta negativa.
        x = [x, panta_neg*i+trans_neg];
    end
    if i >= indice + T - 3
        %Daca s-a deppasit o perioada, se muta indicele cu o perioada,
        %la fel si pentru translatari.
        indice = indice + T;
        trans_poz = trans_poz - T*panta_poz;
        trans_neg = trans_neg - T*panta_neg;
    end
end
plot(y,x)
grid
axis([BEGIN END niv_min-1 niv_max+1])
xlabel("t")
ylabel("x(t)")