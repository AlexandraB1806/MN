% Derivare numerica
% Metoda Taylor de ord 2

function [values] = Taylor_2(df, dfdt, dfdx, t0, x0, h, N)
    values = zeros(N + 1, 1);
    % Prima valoare este cea pe care o primim, x0, cea in t0
    values(1) = x0;
    
    for i = [2:N+1]
        tk = t0 + h * (i - 2);
        xk = values(i - 1);
        % Aplic formula
        values(i) = xk + h * df(tk, xk) + 1 / 2 * h^2 * (dfdt(tk) + dfdx(xk) * df(tk, xk));
    endfor
endfunction

% Testare:

# function [y] = df(t, x)
# y = -x + exp(-t);
# endfunction

# function [y] = dfdt(t)
# y = -exp(-t);
# endfunction

# function [y] = dfdx(x)
# y = -1;
# endfunction

% Apelare:
# res_2 = Taylor_2(@df, @dfdt, @dfdx, 0, 0, 0.1, 30)