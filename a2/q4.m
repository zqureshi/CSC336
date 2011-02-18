% Question 4

n = 1;
relErr = 0;

fprintf('n\trelative  error\t\trelative residual\tcond(A)\t\t\tdet(A)\n');
while relErr <= 1
  [A, xstar, b] = genMatrix(n);
  x = A \ b;
  relErr = norm(xstar - x) / norm(xstar);
  relRes = norm(b - A * x) / norm(b);
  fprintf('%d\t%.15e\t%.15e\t%.15e\t%.15e\n', n, relErr, relRes, cond(A), det(A));
  
  n = n + 1;
end