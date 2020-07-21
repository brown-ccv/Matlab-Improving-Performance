function [T, T_last, res] = solve_sparse(T,T_last, res, tol)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

connections_i = [1, 0, -1, 0];
connections_j = [0, 1, 0, -1];

N = length(T);

T = reshape(T, [numel(T), 1]);
T_last = reshape(T_last, [numel(T), 1]);

iter = 0;

A = spalloc(N^2, N^2, 4*N);

for i = 1:N
    for j = 1:N
        index_i = sub2ind([N,N], i, j);
        
        if (i == 1 || i == N || j==1 || j==N)
            A(index_i, index_i) = 1;
        else
            index_j = sub2ind([N, N], i*ones(4,1)+connections_i,...
                                j*ones(4,1)+connections_j);
            A(index_i*ones(4,1), index_j) = 0.25;
        end
    end
end

while (res > tol)
    
    T = A*T_last;
    
    res = max(max( T - T_last));


    T_last = T;
    iter = iter+1;
end

T = reshape(T, [N, N]);
T_last = reshape(T_last, [N,N]);
end

