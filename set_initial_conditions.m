function [T] = set_initial_conditions(N, Tmax)
% Set up initial conditions
%   N = total number of elements in each dimention

    T = zeros(N,N);
    
    T(:,end) = (1:N)*(Tmax/N);
    
    T(end,:) = (1:N)*(Tmax/N);
end

