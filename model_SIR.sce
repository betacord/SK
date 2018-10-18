// Model SIR

b = 0.02; //beta
g = 0.5; //gamma
N0 = [999;1;0]; // stan poczatkowy
t = [0:0.1:10]; // os czasu

function Ndot = sir(t, N)
    Ndot = [-b * N(1)* N(2);
        b * N(1) * N(2) - g * N(2);
        g * N(2)];
endfunction

//rozwiazanie
N = ode(N0, t(1), t, sir);

plot(t, N(1,:), "b", t, N(2, :), "r", t, N(3, :), "g");
xtitle("Model SIR", "t", "S, I, R");
