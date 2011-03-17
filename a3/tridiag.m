function [A, b] = tridiag(n)
%TRIDIAG Generate tridiagonal matrixes with
%   -2 on main diagonal and -1 on sub and super
A = zeros(n);
for i = 1:n
  A(i, i) = 2;
  if i+1 <= n
    A(i, i+1) = -1;
  end
  if i-1 >= 1
    A(i, i-1) = -1;
  end
end

b = 1 / ((n+1)^2) * ones(n, 1);

