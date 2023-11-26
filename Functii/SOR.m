% Forma analitica a metodei suprarelaxarii
function [x, err, steps] = SOR(A, b, x0, tol, max_steps, w)
  % Verificare omega
  if (x >= 2) || (w <= 0)
    disp('omega trebuie sa fie in intervalul (0,2)');
    steps = -1;
    err = NaN; % ?
    x = NaN;
    return;
  endif
  
  steps = 0;
  prev_x = x0;
  x = prev_x;
  n = length(x);
    
  % Cautam solutia
  while 1
    for i = [1:n]
       % x proaspat calculat de la pasul (k+1)
       sum1 = A(i, 1:i-1) * x(1:i-1);
       % x vechi, calculat de la pasul k
       sum2 = A(i, i+1:n) * prev_x(i+1:n);
       % Solutia
       x(i) = (1-w) * x(i) + w * (b(i) - sum1 - sum2) ./ A(i, i);
    endfor
    
    % Conditia de oprire
    err = norm(x - prev_x);
    if (++steps == max_steps) || (err < tol)
      return;
    endif
        
    prev_x = x;
    endwhile
endfunction