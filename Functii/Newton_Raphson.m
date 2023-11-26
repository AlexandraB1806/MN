% Metoda tangentelor de ordinul I a lui Newton

% f-continua si derivabila cu valori reale
% f - strict monotona (derivata nu se anuleaza)
% Avem nevoie de o aproximare initiala a unei radacini (x0)

% df = derivata lui f
function [rad, err, steps] = Newton_Raphson(f, df, x0, tol, max_steps)
    steps = 0;
    rad = x0;
    
    while 1
      old_rad = rad;
      rad = rad - feval(f, rad) / feval(df, rad);
        
      err = abs(old_rad - rad);
      if (++steps == max_steps || err < tol)
        return;
      endif
    endwhile
endfunction

% Tipps pentru a calcula derivata
% Nu merge pt apelul functiei din pacate :(
% pkg load symbolic
% x = sym("x");
% f = log(x) + 3*x^2 - 4*x - 1;
% diff(f, x);

% ex (functia f si derivata ei df)
% function[y] = f(x)
% y = log(x) + 3*x^2 - 4*x - 1;
% endfunction

% function[y] = df(x)
% y = 1/x + 6*x - 4;
% endfunction
