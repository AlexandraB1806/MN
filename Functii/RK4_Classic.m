% Metoda Runge-Kutta de ord 4 clasica
function [values] = RK4_Classic(df, t0, x0, h, N)
    values = zeros(N + 1, 1);
    values(1) = x0;
    
    for i = [2:N+1]
        tk = t0 + h * (i - 2);
        xk = values(i - 1);
        
        k1 = h * df(tk, xk);
        % Mergem jumatati de pas pe pantele k1 si k2
        k2 = h * df(tk + h/2, xk + k1/2);
        k3 = h * df(tk + h/2, xk + k2/2);
        % Mergem pas intreg pe panta k3
        k4 = h * df(tk + h, xk + k3);
        
        % Aplic formula
        values(i) = xk + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);
    endfor
endfunction