% Metoda puterii inverse (aflu valoarea proprie cea mai putin dominanta)
% Scop: gasirea celei mai mici val pr + vect pr asociat
% lambda - val pr; x - vect pr

% Rata de convergenta: r = cea mai mica val pr / urm cea mai mica
function [lambda, x, err, steps] = MPI(A, x0, tol, max_steps)
  steps = 0;
  prev_x = x0;
  
  while 1
    % Rezolvam A * x = x_prev
    % Ca si cum am rez sist A * x = b
    % Folosesc factorizare QR
    [Q, R] = qr(A);
     y = Q' * prev_x;
     opt.UT = true;
     x = linsolve(R, y, opt);
     
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