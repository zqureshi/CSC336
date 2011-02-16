% MATLAB script to approximate e
format long;

% Output header
fprintf('k\tn\t\tapproximation\t\terror\n');

for k = 1:20
    n = 10^k;
    e = (1 + 1/n)^n;
    
    fprintf('%d\t%e\t%.15e\t%.15e\n', k, n, e, e-exp(1));
end