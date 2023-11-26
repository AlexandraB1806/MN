function [S, added_points] = adaptive_simpson(f, a, b, tol)
    function [S] = simpson(f, a, b, n)
        h = (b-a)/(2*n);
        S = h/3 * (f(a)+4*sum(f(a+h:2*h:b-h))+2*sum(f(a+2*h:2*h:b-2*h))+f(b));
    endfunction
    
    added_points = 0;
    S1 = simpson(f, a, b, 1, tol);
    S2 = simpson(f, a, b, 2, tol);
    if abs(S2-S1) < 15*tol
        S = S2+(S2-S1)/15;
    else
        c = (a+b)/2;
        [left, left_added] = adaptive_simpson(f, a, c, tol/2);
        [right, right_added] = adaptive_simpson(f, c, b, tol/2);
        
        S = left + right;
        added_points = left_added + right_added + 1;
    endif
endfunction