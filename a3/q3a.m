fprintf('n\tABSTOL\t\tJacobi\tGauss-Seidel\n');

for n = [10 100 1000]
  for ABSTOL = [10^-6 10^-8 10^-10]
    [A, b] = tridiag(n);
    [xJ, kJ] = jacobi(A, b, ABSTOL);
    [xG, kG] = gaussSeidel(A, b, ABSTOL);
    
    fprintf('%u\t%u\t%u\t%u\n', n, ABSTOL, kJ, kG);
  end
end