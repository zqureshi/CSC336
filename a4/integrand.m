function f = integrand(x)
global xNodes fAtxNodes;
f = sqrt(abs(x));
xNodes = [xNodes x];
fAtxNodes = [fAtxNodes f];
end