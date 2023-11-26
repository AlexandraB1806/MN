% Metoda bisectiei -> bazata pe interval(cautare binara)

% Rezolva ecuatia f(x) = 0 pt x real
% f definita pe intervalul [a,b]
% Conditii: f-cont si f(a) * f(b) < 0

% Met robusta(converge sigur daca sunt resp cond) dar lenta

% rad = sol ec
function [rad, err, steps] = Bisection(f, a, b, tol, max_steps)
  steps = 0;
  
  while 1
    rad = (a + b) / 2;
    if (feval(f, a) * feval(f, rad) < 0)
      b = rad;
    elseif (feval(f, rad) * feval(f, b) < 0) %feval(f, a) * feval(f, rad) > 0
      a = rad;
    else
      return; % daca produsul este 0, am gasit rad
    endif

    err = b - a;
    if (++steps == max_steps || err < tol)
      return;
    endif
  endwhile
endfunction

% Verificare
% Pt debug:
% rad
% a
% b
% in cadrul lui while

% Am o functie la dispozitie(dintr-un fisier/command window)

% ex:
% function[y] = f(x)
% y = x^3 + cos(x) + e^x + sqrt(x+1);
% endfunction

% calcularea lui f in 2 puncte ce apartin lui R: de ex f(-1) si f(100)
% f(-1) < 0 si f(100) > 0 => f-cont => sigur met bisectiei este conv

% Apelare (cu referinta prin @) !!!
% [rad, err, steps] = Bisection(@f, -1, 100, 1e-8, 100);