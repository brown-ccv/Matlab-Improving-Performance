close all;
clear all;
clc;

%% ----------------------------------------- %%

% Finite difference code to solve wave equation inside 2D rectangular
% domains.

% set up the initial value problem
%      0         T         0
%   0  +-------------------+  0
%      |                   |
%      |                   |
%      |                   |
%   T  |                   |  T
%      |                   |
%      |                   |
%      |                   |
%   0  +-------------------+ 100
%      0         T         100

% The goal here is to show how to profile your code and how to optimize
% standard operations using vectorization.

%% ----------------------------------------- %%

% set up initial conditions

% input parameters
L   = 100; % size of domain
N = 100; % total number of elements in each dimention
Tmax = 100;
max_iter = 8000;
iter = 0;
res = inf;
tol = 1e-5;
% 
% %% ---------------------------------------- %%

% % solve for every time step
% 
% [T_last] = set_initial_conditions(N, Tmax);
% 
% tic
% T = zeros(N,N);
% T(:,end) = T_last(:,end);
% T(end,:) = T_last(end,:);
% 
% [T, T_last, res] = solve_loops(T, T_last, res, tol);
% 
% toc


% %% --------------------------------------------- %%
% % 
% % vectorized solutions
% % 
% % 
% res = inf;
% 
% [T_last] = set_initial_conditions(N, Tmax);
% 
% %solve for every time stamp
% 
% tic
% T = zeros(N,N);
% T(:,end) = T_last(:,end);
% T(end,:) = T_last(end,:);
% 
% [T, T_last, res] = solve_vectorized(T, T_last, res, tol);
% 
% toc

% -------------------------------------- 

% % vectorization using matrix vector
% 
% res = inf;
% 
% [T_last] = set_initial_conditions(N, Tmax);
% 
% tic
% T = zeros(N,N);
% T(:,end) = T_last(:,end);
% T(end,:) = T_last(end,:);
% 
% [T, T_last, res] = solve_matrix(T,T_last, res, tol);
% 
% toc

% %% ------------------------------------- %%

% vectorization using sparse matrix vector

res = inf;

[T_last] = set_initial_conditions(N, Tmax);

tic
T = zeros(N,N);
T(:,end) = T_last(:,end);
T(end,:) = T_last(end,:);

[T, T_last, res] = solve_sparse(T,T_last, res, tol);

toc

