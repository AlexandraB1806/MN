% Metoda Romberg folosind Extrapolarea Richardson cu Trapeze
% Vom forma "triunghiul Romberg"

% Calculam coloana cu coloana:
% - prima are (n+1) elem;
% - a doua are n elem;
% - ...;

function [R] = Romberg(f, a, b, n)
  % Initializam prima coloana care are (n+1) elem
  prev_R = zeros(n + 1, 1);
  for i = [1:n + 1]
    prev_R(i) = Trapezoidal(f, a, b, 2^(i - 1));
  endfor
  
  % Mai cream inca n coloane:
  for j = [1:n]
    % Avem o noua coloana de lung celei anterioare - 1
    R = zeros(length(prev_R) - 1, 1);
    for i = [2:length(prev_R)]
      % Formula de la Extrapolarea Richardson
      R(i - 1) = prev_R(i) + (prev_R(i) - prev_R(i - 1)) / (2^(2 * j) - 1);
    endfor
    prev_R = R;
  endfor
endfunction

% Testare:

# function [y] = f(x)
# y = sin(x).*(x .^ 2 + exp(x)).^(0.7);
# endfunction

% Apelare:
# R = Romberg(@f, -20, 20, 7)
# R = 1.8645e+05