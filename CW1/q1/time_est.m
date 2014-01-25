%generate relationship between data
coeffs = polyfit(n, t, 1);
ntot = floor((T - coeffs(2))/coeffs(1));
nm = 128; %by assumption.
nmin = n(1); %  by virtue of order.
% x(1) = nmin , x(2) = nm, x(3) = interval, x(4) = ntot
syms interval
x = [nmin, nm, interval, ntot];

interval = solve('(2*x(1) + x(2))*(x(2)+ x(3)*x(1)) = 2*x(3)*x(1)*x(1))');

% we want a or x(3)
