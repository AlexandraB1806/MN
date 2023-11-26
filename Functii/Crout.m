% Alg factorizare LU
% Scop: Din A sa obtinem L si U
% Crout impune ca U(i,i) = 1
function[L, U] = Crout(A)
  n = length(A);
  L = zeros(n);
  U = eye(n); % impunere Crout
  for p = [1:n] % pivot, elem diagonal
    % Calculez mai intai de sus in jos L
    for i = [p:n]
      L(i, p) = A(i, p) - L(i, 1:p-1) * U(1:p-1, p);
    endfor
    % Dupa calculez U de la stanga la dreapta
    for j = [p+1:n]
      U(p, j) = (A(p, j) - L(p, 1:p-1) * U(1:p-1, j)) / L(p, p);
    endfor
  endfor
endfunction
