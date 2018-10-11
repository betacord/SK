// Model Malthusa - ODE (równania różniczkowe zwyczajne)

// Parametry modelu
T = 20; // min - czas podwajania populacji
N0 = 1; // liczbebność początkowa populacji
bd = log(2) / T; // dzietność netto
mb = 1e-15; //masa 1 bakterii E. coli [kg]
t = 0:T:24*60 //oś czasu [min]

// Definicja ODE
function Ndot = malthus(t, N)
    Ndot = bd * N;
endfunction

// Rozwiazanie
N = ode(N0, t(1), t, malthus);

// Wykres
plot(t, N);
xtitle("Model Malthusa", "Czas [min]", "Liczebność");
xinfo("Masa bakterii po 24h: " + string(N($) * mb) + "kg");
