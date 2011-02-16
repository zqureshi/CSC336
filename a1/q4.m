% MATLAB script for evaluation cos 2*m*pi
format long

fprintf('k\tm\t\t2*m*pi\t\t\tcos(2*m*pi)\n');

for k = 1:20
    m = 10^k;
    
    fprintf('%d\t%e\t%.15e\t%.15e\n', k, m, 2*m*pi, cos(2*m*pi));
end