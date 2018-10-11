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
subplot(2, 2, 1);
plot(t, N);
xtitle("Model Malthusa", "Czas [min]", "Liczebność");
xinfo("Masa bakterii po 24h: " + string(N($) * mb) + "kg");

subplot(2, 2, 2);
plot(t, log10(N));
xtitle("Model Malthusa log10", "Czas [min]", "Liczebność");
xinfo("Masa bakterii po 24h: " + string(N($) * mb) + "kg");

subplot(2, 2, 3);
plot(t, sqrt(N));
xtitle("Model Malthusa sqrt", "Czas [min]", "Liczebność");
xinfo("Masa bakterii po 24h: " + string(N($) * mb) + "kg");

subplot(2, 2, 4);
plot(t, N^(1/3));
xtitle("Model Malthusa cbrt", "Czas [min]", "Liczebność");
xinfo("Masa bakterii po 24h: " + string(N($) * mb) + "kg");
