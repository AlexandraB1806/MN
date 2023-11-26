% Implementare sugestie laborator=>GrSch modificat
function [Q, R] = GramSchmidt(A)
    n = length(A);
    
    % Initializari matrici Q si R
    R = zeros(n);
    Q = zeros(n);
    
    % Parcurgem toate coloanele
    for i = [1 : n]
        R(i, i) = norm(A(:, i)');
        Q(:, i) = A(:, i) / R(i, i);
        for j = [i+1 : n]
            R(i, j) = Q(:,i)' * A(:, j);
            A(:, j) = A(:, j) - Q(:, i) * R(i, j);
        endfor
    endfor
endfunction  