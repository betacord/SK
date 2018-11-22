// model rzutu ukosnego: grawitacja, opor powietrza

// parametry
rho = 1.2;
cx = 0.47;
m = 0.056;
R = 0.0343;
S = %pi * R ^ 2;
g = 9.814;
t = [0:0.01:20];
x0 = 0;
y0 = 0;
V0 = 20;
alpha = 45 * %pi / 180;
Vx0 = V0 * cos(alpha);
Vy0 = V0 * sin(alpha);
N0 = [x0;Vx0;y0;Vy0];

// model
function Ndotdot = projectile(t, N)
    A = -0.5 * cx * rho * S;
    Ndotdot = [N(2);
               A * N(2) * abs(N(2)) / m;
               N(4);
               (-m * g + A * N(4) * abs(N(4))) / m];
endfunction

// rozwiazanie
N = ode(N0, t(1), t, projectile);

// wykres
subplot(131);
plot(N(1, :), N(3, :));
xtitle('Trajektoria ciała', 'x[m]', 'y[m]');

subplot(132);
plot(t, N(2, :));
xtitle('Prędkość pozioma', 't[s]', 'Vx[m/s]');

subplot(133);
plot(t, N(4, :));
xtitle('prędkośc pionowa ciała', 't[s]', 'Vy[m/s]');
