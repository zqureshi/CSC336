y = [0 1 2 3 4 5 6 7 8];
t = y.*y;

points = 0:64/1000:64;
y_sqrt = sqrt(points);
y_poly = spline(t, y, points);

plot(points, y_sqrt, 'r', points, y_poly, 'b');
title('spline interpolant');
legend('sqrt', 'spline interpolant');

error = abs(y_sqrt - y_poly);
plot(points, error);
title('spline error');
legend('error');