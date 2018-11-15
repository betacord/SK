// spadek swobodny z oporem powietrza - ODE 2. rzedu
// spadek piłeczki tenisowej z Wieży Eiffla

// params:
rho = 1.2;
cx = 0.47;
m = 0.056;
R = 0.0343;
S = %pi * R ^ 2;
g = 9.814;
t = [0:0.01:25];
H = 356.5;
N0 = [H;0];

// model
function h = wysokosc(t, N)
    h = N(1);
endfunction

function Ndot = spadek(t, N)
    Ndot = [N(2);
            (0.5 * cx * rho * S * N(2) ^ 2 - m * g) / m];
endfunction

N = ode('root', N0, t(1), t, spadek, 1, wysokosc);
n = size(N, 2);

subplot(121);
plot(t(1:n), N(1, :));
xtitle('Położenie ciała', 't[s]', 'x[m]');

subplot(122);
plot(t(1:n), N(2, :));
xtitle('Prędkość ciała', 't[s]', 'Vx[m/s]');
