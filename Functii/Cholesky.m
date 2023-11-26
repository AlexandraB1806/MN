% Alg factorizare LU
% Necesar: A-simetrica/ hermitiana in complex; A-poz/simpoz def

% A-simetrica => A = At
% Poz definire: -> Toti det din stanga sus sunt > 0
% Semipoz definire: -> A-diagonal dominanta (modulul A(i,i) >= suma celorlalte elem

% Impunere Cholesky: L = Ut (aflu L, automat stiu U)
function [L] = Cholesky(A)
  [n n]= size(A);
% Verific daca pot aplica Cholesky

  if !isequal(A, A') % A-simetrica
    L = NaN;
    return
  endif
  
  for i = [1:n] % A-pozitiv definita
    if det(A(1:i, 1:i)) <= 0
      L = NaN;
      return
    endif
  endfor
  
  for i = [1:n] % A-semipozitiv definita
    s = 0;
    p = A(i, i);
    for j = [1:n]
      s = s + abs(A(i, j));
      s = s - p;
      if abs(p) < s
        L = NaN;
        return
      endif
    endfor
  endfor
  
% Daca se ajunge aici, putem aplica Cholesky
  L = zeros(n);
  for i = [1:n]
    for j = [1:i-1]
      L(i, j) = (A(i, j) - L(i, 1:j-1) * L(j, 1:j-1)') / L(j, j);
    endfor
    L(i, i) = sqrt(A(i, i)- L(i, 1:i-1) * L(i, 1:i-1)');
  endfor
endfunction