% Forma matriceala a lui Jacobi
% A = D + L + U
% Stim ca A = N - P => P = N - A
% N = D

function [x, err, steps] = Jacobi_matrix_form(A, b, x0, tol, max_steps)
 N = diag(diag(A)); % diag(A) imi returna un vector
 P = N - A;
 inv_N = inv(N);
 
 % matricea de iteratie Jacobi
 % Daca raza spectrala a lui G < 1 => met converge
 G = inv_N * P;
 
 % vectorul de iteratie Jacobi
 c = inv_N * b;
 
 prev_x = x0;
 steps = 0;
 
 while 1
   x = G * prev_x + c;
   
   % Conditia de oprire
   err = norm(x - prev_x);
   if (++steps == max_steps) || (err < tol)
     return;
   endif
  
  prev_x = x;
 endwhile
endfunction