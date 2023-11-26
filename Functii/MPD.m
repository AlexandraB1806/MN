% Metoda puterii directe (aflu valoarea proprie cea mai dominanta)
% Scop: gasirea unei perechi: (val pr, vect pr)
% lambda - val pr; x - vect pr

% Rata de convergenta: r = a 2-a cea mai mare val pr / cea mai mare
function [lambda, x, err, steps] = MPD(A, x0, tol, max_steps)
  steps = 0;
  prev_x = x0;
  
  while 1
    x = A * prev_x;
    % Normam x (pt ca vectorul devine infinit de lung)
    x = x / norm(x);
    % Aflam lambda
    lambda = x' * A * x;
    
    % Asa se calculeaza eroarea!
    err = norm(x - prev_x);
    % Conditia de iesire
    if (++steps == max_steps || err < tol)
      return;
    endif
    
    % Actualizam x-ul anterior
    prev_x = x;

  endwhile
endfunction