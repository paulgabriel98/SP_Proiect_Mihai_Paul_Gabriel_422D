%Punctul de incepere al reprezentarii(de pe axa orizontala).
BEGIN=-2;
%Punctul de incheiere al reprezentarii(de pe axa orizontala).
END=3;
rez_temp=0.002;
%Generez un vector numit y de la BEGIN la END cu pasul rezolutia temporara.
%El va fi folosit la reprezentarea grafica drept axa Ox.
y = BEGIN:rez_temp: END;
fct_umpl = 0.25;%factor de umplere
niv_min = -1;
niv_max = 0.5;
T = 2;%perioada
%Variabila "indice" este folosita pentru a corela o valoare din y lui +0.5
%sau -1.
indice = BEGIN + fct_umpl*T;
x=niv_max;%vectorul semnal, care va fi completat in urmatoarea bucla for.
for i = BEGIN + rez_temp:rez_temp:END
    if i < indice
        %Valoarea corespunzatoare este 0.5 si o adauga in vectorul x.
        x = [x, niv_max];
    else
        %Acelasi lucru ca mai sus.
        x = [x, niv_min];
    end
    if i > indice + (1-fct_umpl)*T
        %Inseamna ca trebuie sa marim indicele pentru ca s-a efectuat o
        %perioada
        indice = indice + T;
    end
end
plot(y,x)
grid
axis([BEGIN END niv_min-1 niv_max+1])
xlabel("t")
ylabel("x(t)")