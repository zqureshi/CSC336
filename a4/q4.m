IntegralVal = 4/3;

global xNodes fAtxNodes; %#ok<*NUSED,TLEV>
fprintf('Evaluations using quad\n');
fprintf('TOL\t\tApprox\t\tAbs Err\t\tPoints of Eval\n');
fprintf('-------------------------------------------------------\n');
for TOL = [10^-2 10^-4 10^-6 10^-8]
  xNodes = [];
  fAtxNodes = [];
  [q, count] = quad(@integrand, -1, 1, TOL);
  fprintf('%d\t%d\t%d\t%d\n', TOL, q, IntegralVal - q, count);
  plot(xNodes, fAtxNodes, '.');
  legend(sprintf('TOL: %d, Points: %d', TOL, count));
  title('Approximation using quad');
  print('-dpng', sprintf('quad-%d', count));
end

fprintf('\nEvaluations using quadl\n');
fprintf('TOL\t\tApprox\t\tAbs Err\t\tPoints of Eval\n');
fprintf('-------------------------------------------------------\n');
for TOL = [10^-2 10^-4 10^-6 10^-8]
  xNodes = [];
  fAtxNodes = [];
  [q, count] = quadl(@integrand, -1, 1, TOL);
  fprintf('%d\t%d\t%d\t%d\n', TOL, q, IntegralVal - q, count);
  plot(xNodes, fAtxNodes, '.');
  legend(sprintf('TOL: %d, Points: %d', TOL, count));
  title('Approximation using quadl');
  print('-dpng', sprintf('quadl-%d', count));
end

% OUTPUT
% Evaluations using quad
% TOL		Approx		Abs Err		Points of Eval
% -------------------------------------------------------
% 1.000000e-02	1.327829e+00	5.503924e-03	17
% 1.000000e-04	1.332644e+00	6.895516e-04	33
% 1.000000e-06	1.333322e+00	1.110258e-05	73
% 1.000000e-08	1.333333e+00	6.674569e-08	177
%
% Evaluations using quadl
% TOL		Approx		Abs Err		Points of Eval
% -------------------------------------------------------
% 1.000000e-02	1.332311e+00	1.022429e-03	48
% 1.000000e-04	1.333305e+00	2.841577e-05	108
% 1.000000e-06	1.333333e+00	7.900624e-07	168
% 1.000000e-08	1.333333e+00	6.203369e-10	408
