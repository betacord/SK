// Chaos deterministyczny - modelowanie i prognozowanie rozkladu temperatury

// Model Lorenza - wersja stabilna

//Parametry
sigma = 5;
rho = 20;
betta = 3;

N0 = [1;0;0];
t = [0:0.1:10];

// Definicja modelu
function Ndot = lorenz(t, N)
    Ndot = [sigma * (N(2) - N(1));
            N(1) * (rho - N(3)) - N(2);
            N(1) * N(2) - betta * N(3)];
endfunction

// Rozwiazanie
N = ode(N0, t(1), t, lorenz);

// Wykresy
param3d(N(1,:), N(2, :), N(3, :));
xtitle("Model Lorenza", "x", "y", "z");

