% Metoda puterii ortogonalizata - netestata
% Matricea A trb sa fie neaparat simetrica (A = A * A' mereu sim)
% A-simetrica => toti vectorii proprii sunt ortogonali 2 cate 2
% Aflu a doua val pr cea mai dominanta

% X = matrice care are pe coloana i un vector propriu x_i
% l = vector care are pe pozitia i valoarea proprie lambda_i
function [X l] = MPO(A, tol, max_steps)
  % La inceput matricea si vectorul sunt goale
  X = [];
  l = [];
  n = length(A);
  
  for i = [1:n]
    % plecam de la un u0 = prev_x random
    prev_x = rand(n, 1);
    steps = 0;
    while 1
      for j = [1:size(X, 2)] % size(X,2) = nr col; size(X,1) = nr linii
        % stergem componentele {x1,..,xi-1} din u0 la pasul i
        prev_x = prev_x - X(:, j)' * prev_x * X(:, j);
      endfor
      
      % Aplic MPD
      x = A * prev_x;
      % Normez x
      x = x / norm(x);
      % Aflu lambda
      lambda = x' * A * x;
      
      err = norm(x - prev_x);
      if (++steps == max_steps || err < tol)
        l = [l, lambda];
        X = [X, x];
        break;
      endif
      prev_x = x;
    endwhile
  endfor
endfunction