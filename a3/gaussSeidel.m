function [xCurr, k] = gaussSeidel(A, b, ABSTOL);
%GAUSSSEIDEL Computes Approximate solution to Ax = b using the 
%   Gauss-Seidel method and returns the number of iterations
%   before the absolute tolerance is reached
n = length(A);
xPrev = zeros(n, 1);
xCurr = ones(n, 1);

k = 0;
tolerance = norm(xCurr - xPrev, inf);
while tolerance > ABSTOL
  k = k + 1;
  for i = 1:n
    sum = 0;
    for j = 1:i-1
        sum = sum + A(i,j) * xCurr(j);
    end
    for j = i+1:n
        sum = sum + A(i,j) * xPrev(j);
    end
    xCurr(i) = (b(i) - sum) / A(i,i);
  end
  tolerance = norm(xCurr - xPrev, inf);
  xPrev = xCurr;
end
end