t = [0 1 2 3 4 5 6 7 8 9 10];
f = [.0000 .8415 .09093 .1411 -.7568 -.9589 -.2794 .6570 .9894 .4121 -.5440];

% Interpolate D0 and evaluate second derivative at each t
S = spline(t, f);
[breaks, coefs, l, k, d] = unmkpp(S);

derivative = zeros(l, k-2);
for i = 1:l
  c = coefs(i, :);
  derivative(i, :) = polyder(polyder(c));
end
d2S = mkpp(breaks, derivative);

% Calculate second derivative using spline-on-spline
derivative = zeros(l, k-1);
for i = 1:l
  c = coefs(i, :);
  derivative(i, :) = polyder(c);
end
dS = mkpp(breaks, derivative);
df = ppval(dS, t);

SCap = spline(t, df);
[breaks, coefs, l, k, d] = unmkpp(SCap);

derivative = zeros(l, k-1);
for i = 1:l
  c = coefs(i, :);
  derivative(i, :) = polyder(c);
end
dSCap = mkpp(breaks, derivative);

% Plot graphs and absolute errors
points = linspace(0, 10, 1001);
y_d2sin = -sin(points);
y_d2S = ppval(d2S, points);
y_dSCap = ppval(dSCap, points);

plot(points, y_d2sin, 'r', points, y_d2S, 'g', points, y_dSCap, 'b');
legend('-sin (real second derivative)', 'd2S (second derivative)', 'dSCap (spline-on-spline)');

e_d2S = abs(y_d2sin - y_d2S);
e_dSCap = abs(y_d2sin - y_dSCap);
plot(points, e_d2S, points, e_dSCap);
legend('error d2S', 'error dSCap');

fprintf('Max error in d2S = %d\n', max(e_d2S));
fprintf('Max error in dSCap = %d\n', max(e_dSCap));

% OUTPUT:
% Max error in d2S   = 5.362533e+00
% Max error in dSCap = 7.029201e+00