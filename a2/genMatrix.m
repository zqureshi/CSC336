function [A, xstar, b] = genMatrix(n)
A = pascal(n);
xstar = rand(n, 1);
b = A * xstar;
end