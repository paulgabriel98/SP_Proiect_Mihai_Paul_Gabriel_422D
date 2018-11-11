rez_temp = 0.002;
T = 4;
A = 1.5;
BEGIN = -3;
END = 3;
x = BEGIN : rez_temp : END;
y = A*sin(2*pi*(1/T)*x);
%Vectorul y devine modulul sau.
y = abs(y);
plot(x,y)
grid
xlabel("t")
ylabel("x(t)")
