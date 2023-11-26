% Forma nematriceala/analitica a lui Jacobi
function [x, err, steps] = Jacobi_analitic(A, b, x0, tol, max_steps)
 prev_x = x0;
 x = prev_x;
 n = length(x);
 steps = 0;

  while 1
    for i = [1:n]
      % Facem suma de la 1 la n dar "ocolim" i
      sum_before_i = A(i, 1:i-1) * x(1:i-1);
      sum_after_i = A(i, i+1:n) * x(i+1:n);
      % Calculam noua aproximare a lui x
      x(i) = (b(i) - sum_before_i - sum_after_i) / A(i, i);
    endfor
    
    % Conditia de oprire
    err = norm(x - prev_x);
    if (++steps == max_steps) || (err < tol)
      return;
    endif
    
    prev_x = x;
  endwhile
endfunction