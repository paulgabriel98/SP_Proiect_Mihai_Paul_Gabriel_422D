rez_temp = 0.002;
T = 3;%perioada
A = 0.8;%amplitudinea
BEGIN = -3;
END = 3;
x = BEGIN : rez_temp : END;
y = A*sin(2*pi*(1/T)*x);
[linii coloane] = size(y);

%Pentru intrarile negative din y, se modifica in 0.
for i = 1 : coloane
    if y(i) < 0
        y(i) = 0;
    end
end
plot(x,y)
grid
xlabel("t")
ylabel("x(t)")
