% Q2:c
for i = [10 100 500]
  A = triu(rand(i, i), -1);
  B = rand(i, 1);
  
  [LU, piv] = uhfactor(A);
  MATLAB  = norm(A \ B)
  UHSOLVE = norm(uhsolve(LU, piv, B))
end