function [LU, piv] = uhfactor(A)
%UHFACTOR LU factorization of A with row pivoting

% Assuming A is n x n
n = length(A);
LU = zeros(n);
piv = 1:n;
I = eye(n);

for i = 1:n-1
  % Partial Pivoting
  if A(piv(i+1), i) > A(piv(i), i)
    piv([i i+1]) = piv([i+1 i]);
    L([i i+1], :) = LU([i+1 i], :);
  end
  
  for j = i+1:n
    LU(j, i) = A(piv(j), i) / A(piv(i), i);
  end
  e = zeros(1, n);
  e(i) = 1;
  m = LU(:, i);
  M = I - m*e;
  
  % Matrix multiplication with pivoting
  T = A;
  for x = 1:n
    for y = 1:n
      sum = 0;
      for z = 1:n
        sum = sum + M(x, z) * A(piv(z), y);
      end
      T(piv(x), y) = sum;
    end
  end
  A=T;
end
A = A(piv, :);

LU = LU + I;
for i = 1:n
  LU(i, i:n) = A(i, i:n);
end
end

