% T(f, h) = aproximarea prin Trapeze a functiei f prin pasul h
% La regula Trapezelor se introduc met Newton-Cotes pt pct echidistante

% a = x0
% b = xn

% Met de ord 2; interpolare liniara
function [T] = Trapezoidal(f, a, b, n)
  % aflu pasul h
  h = (b - a) / n;
  % aflu aproximarea si o returnez
  T = h * ((f(a) + f(b)) / 2 + sum(f(a + h:h:b - h)));
endfunction

% Testare:

# function [y] = f(x)
# y = sqrt(x .^ 2 + 1);
# endfunction

% Apelare:
# T = Trapezoidal(@f, -1, 1, 10)
# T = 2.3003