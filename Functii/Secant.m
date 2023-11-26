% Metoda secantei -> bazata pe interval
% Are nevoie de 2 valori initiale (2 puncte)

% Rezolva ec f(x) = 0 pt x real

% rad = sol ec
function [rad, err, steps] = Secant(f, x0, x1, tol, max_steps)
    steps = 0;
    % x - aproximarea veche; rad - aproximarea noua
    rad = x1;
    x = x0;
    
    while 1
        old_rad = rad;
        rad = rad - feval(f, rad) * ((x - rad) / (feval(f, x) - feval(f, rad)));
        x = old_rad;

        err = abs(rad - old_rad);
        if (++steps == max_steps || err < tol)
            return;
        endif
    endwhile
endfunction

% Am o functie la dispozitie(dintr-un fisier/command window)

% ex:
% function [y] = f(x)
% y = log(x) + 3 * (x ^ 2) - 4 * x - 1;
% endfunction

% Apelare (cu referinta prin @) !!!
% [rad, err, steps] = Secant(@f, 1, 2, 1e-5, 10);