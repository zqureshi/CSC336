function [LU, piv] = uhfactor(A)
%UHFACTOR Determine a LU factorization of an upper Hessenberg matrix
% using Gaussian elimination with row pivotings
  n = length(A);
  piv = 1:n;
  LU = zeros(n);
  I = eye(n);
  
  for i = 1:n-1
    % Row Pivoting:
    %   The only non-zero value in column is A(i+1, i)
    if A(piv(i+1), i) > A(piv(i), i)
      piv([i i+1]) = piv([i+1 i]);
      
      % Apply same permutation on L
      LU([i i+1], :) = LU([i+1 i], :);
    end
    
    for j = i+1:n
      LU(j, i) = A(piv(j), i) / A(piv(i), i);
    end
    e = zeros(1, n);
    e(i) = 1;
    m = LU(:, i);
    M = I - m*e;
    A(piv, :) = M * A(piv, :);
  end
  
  LU = LU + I;
  A = A(piv, :);
  
  % Combine L and U forms
  for i = 1:n
    LU(i, i:n) = A(i, i:n);
  end
end

