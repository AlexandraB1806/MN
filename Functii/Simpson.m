% S(f, h) = aproximarea prin regula Simpson a functiei f prin pasul h
% Face parte din met Newton-Cotes pt pct echidistante

% a = x0
% b = x2n

% Met de ord 4; interpolare patratica
function [S] = Simpson(f, a, b, n)
    % aflu pasul h
    h = (b - a) / (2 * n);
    % aflu aproximarea si o returnez
    S = (h / 3) * (f(a) + f(b) + 4 * sum(f(a + h:2*h:b - h)) + 2 * sum(f(a + 2*h:2*h:b - 2*h)));
endfunction

% Testare:

# function [y] = f(x)
# y = sqrt(x .^ 2 + 1);
# endfunction

% Apelare:
# S = Simpson(@f, -1, 1, 10)
# S = 2.2956