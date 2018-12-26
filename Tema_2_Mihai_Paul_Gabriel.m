%Punctul de incepere al reprezentarii(de pe axa orizontala).
BEGIN=0;
%Punctul de incheiere al reprezentarii(de pe axa orizontala).
END=80;
rez_temp=0.2;
%Generez un vector numit y de la BEGIN la END cu pasul rezolutia temporara.
%El va fi folosit la reprezentarea grafica drept axa Ox.
y = BEGIN:rez_temp: END;
T = 40;%perioada
D = 9;%durata
fct_umpl = D/T;%factor de umplere D/T
niv_min = -1;
niv_max = 1;
%Variabila "indice" este folosita pentru a corela o valoare din y lui +1
%sau -1.
indice = BEGIN + fct_umpl*T;
x=niv_max;%vectorul semnal, care va fi completat in urmatoarea bucla for.
for i = BEGIN + rez_temp:rez_temp:END
    if i < indice
        %Valoarea corespunzatoare este 1 si o adauga in vectorul x.
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


%Cu functia "syms" declar o variabila simbolica.
syms t;
omega = (2*pi)/T;
j = sqrt(-1); %Definesc unitatea complexa.
%Sparg integrala in doua integrale pentru cele 2 nivele ale semnalului
%dreptunghiular si inlocuiesc x(t) cu valoarea asociata. Functia "int"
%calculeaza integrala.
k = [-50:1:50];
integr1 = int(niv_max*exp((-1)*j*k*omega*t), t, 0, D);
integr2 = int(niv_min*exp((-1)*j*k*omega*t), t, D, T);
c = integr1+integr2   %Coeficientii dezvoltarii in serie Fourier complexa
A = 2 * abs(c);     %Amplitudinea
figure(1)
stem(k, A) %Reprezint spectrul de amplitudini cu functia "stem" pentru ca e discret
xlabel("Omega")
ylabel("A")
axis([-5 5 0 100])


%Declar un vector nul.
sum = [];
for t = BEGIN:rez_temp:END
    sum1 = 0; %Declar suma partiala pe care urmeaza sa o adaug in vector si o initiez cu 0.
    for k = 1:1:50
        sum1 = sum1 + c(k+51)*exp(j*k*omega*t); 
    end
    sum = [sum sum1]; %Adaug sum1 la vectorul de sume notat "sum".
end
sum = sum * 2;
sum = sum + c(51);  %C(51) reprezinta de fapt C(0) cand vorbim de timp.
sum = sum/T;
figure(2)
plot(y, sum)
hold on
plot(y, x)
grid
axis([BEGIN END niv_min-1 niv_max+1])
xlabel("t")
ylabel("x(t)")
