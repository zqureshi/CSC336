function [L, A, piv] = uhfactor(A)
%UHFACTOR Determine a LU factorization of an upper Hessenberg matrix
% using Gaussian elimination with row pivotings
  n = length(A);
  piv = 1:n;
  L = zeros(n);
  I = eye(n);
  
  for i = 1:n-1
    for j = i+1:n
      L(j, i) = A(piv(j), i) / A(piv(i), i);
    end
    e = zeros(1, n);
    e(i) = 1;
    m = L(:, i);
    A = (I - m*e) * A;
  end
  
  L = L + I;
end

