function [xCurr, k] = jacobi(A, b, ABSTOL)
%JACOBI Computes Approximate solution to Ax = b using the Jacobi
%       method and returns the number of iterationg before the
%       absolute tolerance is reached
n = length(A);
xPrev = zeros(n, 1);
xCurr = ones(n, 1);

k = 0;
tolerance = norm(xCurr - xPrev, inf);
while tolerance > ABSTOL
  k = k + 1;
  for i = 1:n
    sum = 0;
    for j = 1:n
      if j ~= i
        sum = sum + A(i,j) * xPrev(j);
      end
    end
    xCurr(i) = (b(i) - sum) / A(i,i);
  end
  tolerance = norm(xCurr - xPrev, inf);
  xPrev = xCurr;
end
end