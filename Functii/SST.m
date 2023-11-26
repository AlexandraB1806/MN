% Sistem superior triunghiular
% cu vectorizare
% O(n^2)
function[x] = SST(A, b)
  n = length(A);
  x = zeros(n, 1);
  for i = [n:-1:1]
    s = A(i, i+1:n) * x(i+1:n);
    x(i) = (b(i) - s) / A(i, i);
  endfor
endfunction
% Verif: A = triu(A);
