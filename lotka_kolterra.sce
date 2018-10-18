//Lotka-Kolterra
//N1 - ofiary
//N2 - drapieznik

A = 2; //dzietnosc ofiar
B = 0.2; //skutecznosc polowania
C = 3; //smiertelnosc drapieznikow\
D = 0.05; //wspolczynnik konwersyji
N0 = [100;50]; //stan poczatkowy
t = [0:0.1:20]; //os czasu

function Ndot = lotka(t, N)
    Ndot = [(A * N(1) - B*N(1) * N(2));
        -C * N(2) + D * N(1) * N(2)];
endfunction

//rozwiazanie ODE
N = ode(N0, t(1), t, lotka);

subplot(221);
plot(t, N(1, :));
xtitle("Ofiary", "t", "N1");

subplot(222);
plot(t, N(2, :));
xtitle("Drapiezniki", "t", "N2");

subplot(223);
plot(N(1, :), N(2, :));
xtitle("Wykres fazowy", "N1", "N2");

subplot(224);
param3d(N(1, :), N(2, :), t);
xtitle("Wykres 3D", "N1", "N2", "t");
