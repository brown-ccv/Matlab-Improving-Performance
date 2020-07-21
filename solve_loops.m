function [T, T_last, res] = solve_loops(T, T_last, res, tol)
% Solve the laplace equation using for loops 

iter = 0;
N = length(T);

while (res > tol)
    for j = 2:N-1
        for i = 2:N-1
            T(i, j) = 0.25*(T_last(i+1, j) + T_last(i-1, j) ...
                        + T_last(i, j+1) + T_last(i, j-1));
        end
    end

    res = max(max( T - T_last));


    T_last = T;
    iter = iter+1;

end
    
end

