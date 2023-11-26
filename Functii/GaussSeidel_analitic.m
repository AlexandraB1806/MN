% Forma nematriceala/analitica a lui Gauss Seidel
function [x, err, steps] = GaussSeidel_analitic(A, b, x0, tol, max_steps)
 prev_x = x0;
 x = prev_x;
 n = length(x);
 steps = 0;
 
 % Cautam solutia
   while 1
      for i = [1:n]
          % x proaspat calculat de la pasul (k+1)
          sum1 = A(i, 1:i-1) * x(1:i-1);
          % x vechi, calculat de la pasul k
          sum2 = A(i, i+1:n) * prev_x(i+1:n);
          % Solutia
          x(i) = (b(i) - sum1 - sum2) ./ A(i, i);
      endfor
      
      % Conditia de oprire
      err = norm(x - prev_x);
      if (++steps == max_steps) || (err < tol)
          return;
      endif
        
      prev_x = x;
   endwhile
endfunction