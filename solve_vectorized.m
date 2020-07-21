function [T, T_last, res, tol] = solve_vectorized(T, T_last, res, tol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

iter = 0;

N = length(T);

ip = 3:N;
in = 1:N-2;
jp = 3:N;
jn = 1:N-2;

while (res > tol)
    
    T(2:N-1, 2:N-1) = 0.25*(T_last(ip, 2:N-1) + T_last(in, 2:N-1) ...
                    + T_last(2:N-1, jp) + T_last(2:N-1, jn));
    
    res = max(max( T - T_last));
    
    
    T_last = T;
    iter = iter+1;
    
end

end

