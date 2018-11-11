%Punctul de incepere al reprezentarii(de pe axa orizontala).
BEGIN=-3;
%Punctul de incheiere al reprezentarii(de pe axa orizontala).
END=3;
durata = 0.25;
rez_temp=0.02;
x = BEGIN : rez_temp : END;
%Generez cate un vector pentru cele 4 cazuri de niveluri
niveluri1 = [-1 1];
niveluri2 = [-3 -1 1 3];
niveluri3 = [-5 -3 -1 1 3 5];
niveluri4 = [-7 -5 -3 -1 1 3 5 7];
%Generez cate un vector y care incepe aleator de la un nivel
%(aleg aleator un indice din vectorul de niveluri)
y1 = niveluri1(randi(length(niveluri1)));
y2 = niveluri2(randi(length(niveluri2)));
y3 = niveluri3(randi(length(niveluri3)));
y4 = niveluri4(randi(length(niveluri4)));

for i = BEGIN + rez_temp : durata : END + durata
        niv1 = randi(length(niveluri1));
        niv2 = randi(length(niveluri2));
        niv3 = randi(length(niveluri3));
        niv4 = randi(length(niveluri4));
        for j = 1 : durata/rez_temp
            %Adauga in vector nivelul corespunzator care trebuie sa fie
            %acelasi pentru durata/rez_temp puncte
            y1 = [y1 niveluri1(niv1)];
            y2 = [y2 niveluri2(niv2)];
            y3 = [y3 niveluri3(niv3)];
            y4 = [y4 niveluri4(niv4)];
        end
end
figure(1)
plot(x,y1)
grid
axis([BEGIN, END, min(niveluri1) - 1, max(niveluri1) + 1])
figure(2)
plot(x,y2)
grid
axis([BEGIN, END, min(niveluri2) - 1, max(niveluri2) + 1])
figure(3)
plot(x,y3)
grid
axis([BEGIN, END, min(niveluri3) - 1, max(niveluri3) + 1])
figure(4)
plot(x,y4)
grid
axis([BEGIN, END, min(niveluri4) - 1, max(niveluri4) + 1])