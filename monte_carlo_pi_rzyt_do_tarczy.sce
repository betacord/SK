// Metoda Monte Carlo
// Szacowanie wartosci pi metoda hit-or-miss (Monte Carlo)
// symulacja rzutow do tarczy

a = 1;
R = a / 2;
N = 1000;
pi = [];
ntraf = 0;

// losowanie i oszacowanie
n = getdate('s');
grand('setsd', n);

for k = 1 : N
    xy = grand(1, 2, 'unf', -a/2, a/2);
    if norm(xy) <= R then // trafiony
        ntraf = ntraf + 1;
        pi(k) = 4 * ntraf / k;
    end;            
end;

// wykres
plot([1:N], pi, 'bo', [1:N], %pi*ones(1, N), 'r');
xtitle('Szacowana vs oczekiwana wartosc pi', 'Lp', 'Pi');
xinfo('Szacowana wartosc pi: ' + string(pi($)));
