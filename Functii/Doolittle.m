% Alg factorizare LU
% Scop: Din A sa obtinem L si U
% Doolittle impune ca L(i, i) = 1
function[L, U] = Doolittle(A)
  n = length(A);
  U = zeros(n);
  L = eye(n);
  for p = [1:n] % pivot
    % Calculez de la stanga la dreapta U
    for j = [p:n]
      U(p, j) = A(p, j) - L(p, 1:p-1) * U(1:p-1, j);
    endfor
    % Calculez de sus in jos L
    for i = [p+1:n]
      L(i, p) = (A(i, p) - L(i, 1:p-1) * U(1:p - 1, p)) / U(p, p);
    endfor
  endfor
endfunction
