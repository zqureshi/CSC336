function x = uhsolve(LU, piv, b)
%UHSOLVE Solve LUx = Pb for x
n =  length(LU);

% Solve Ly = Pb for y by forward substitution
y = zeros(n, 1);

for i = 1:n
  sum = 0;
  for j = 1:i-1
    sum = sum + LU(i, j) * y(j);
  end
  y(i) = b(piv(i)) - sum;
end

% Solve Ux = y for x by backward substitution
x = zeros(n, 1);
for i = 4:-1:1
  sum = 0;
  for j = i+1:n
    sum = sum + LU(i, j) * x(j);
  end
  x(i) = (y(i) - sum)/LU(i, i);
end
end

