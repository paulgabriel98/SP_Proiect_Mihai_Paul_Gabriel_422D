%Creez vectorul linie a, care are 21 de elemente(coloane) de la 0 la 2 cu pasul 0.1
a=0:0.1:2;
%Creez vectorul coloana b, care trebuie sa aibe tot 21 de elemente, adica 21 de linii, pentru a putea fi realizate operatiile de inmultire a*b respectiv b*a. Folosesc functia de generare "ones" pentru a creea vectorul coloana cu 21 de linii si toate elementele egale cu 1. 
b=ones(21,1);
%Se efectueaza inmultirea celor 2 matrici a*b  rezultatul fiin o matrice cu un singur element.
a*b
%Se efectueaza inmmultirea celor 2 matrici b*a rezultatul fiind tot o matrice cu 21 de linii si 21 de coloane.
b*a
%Se efectueaza inmultirea element cu element a celor 2 vectori cu ajutorul operatorului ".*" si se va obtine acelasi rezultat ca la inmultirea b*a.
a.*b

