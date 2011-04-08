y = [0 1 2 3 4 5 6 7 8];
t = y.*y;
p = polyfit(t, y, 8);

points = 0:64/1000:64;
y_sqrt = sqrt(points);
y_poly = polyval(p, points);

plot(points, y_sqrt, 'r', points, y_poly, 'b');
title('polyfit interpolant');
legend('sqrt', 'interpolant');

error = abs(y_sqrt - y_poly);
plot(points, error);
title('polyfit error');
legend('error');