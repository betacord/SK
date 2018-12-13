// random walk 1D
// parametry
Nsteps = 1000;
grand('setsd', getdate('s'));

steps = [0, 2 * grand(1, Nsteps, 'uin', 0, 1) - 1];
x = cumsum(steps, 2);
xmean = cumsum(steps, 2) ./ [1:Nsteps + 1];
xsq = cumsum(steps.^2, 2) ./ [1:Nsteps + 1];

subplot(131);
plot([1:Nsteps + 1], x);
xtitle('Trajektoria', 'Nr kroku', 'Polozenie');

subplot(132);
plot([1:Nsteps + 1], xmean);
xtitle('Srednia skumulowana', 'Nr kroku', 'x mean');

subplot(133);
plot([1:Nsteps + 1], xsq);
xtitle('Wariancja', 'Nr kroku', 'xsq');
