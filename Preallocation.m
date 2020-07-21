clear all;
close all;
clc;

% Script to show performance of memory allocation vs no allocation

N_vector = logspace(3, 9, 7);
T_na = zeros(length(N_vector), 1);
T_a = zeros(length(N_vector), 1);

for n = 1:length(N_vector)

    clear fibonacci;
    N = N_vector(n);
    tic
    fibonacci = [0,1];
    for idx = 3 : N
       fibonacci(idx) = fibonacci(idx-1) + fibonacci(idx-2);
    end
    T_na(n) = toc;

    clear fibonacci;
    % Now use preallocation ? 5 times faster than dynamic array growth:
    tic
    fibonacci = zeros(N,1);
    fibonacci(1)=0; fibonacci(2)=1;
    for idx = 3 : N
       fibonacci(idx) = fibonacci(idx-1) + fibonacci(idx-2);
    end
    T_a(n) = toc;
end

set(0,'defaultAxesFontSize',16)
plot(N_vector, T_na, '-o', 'LineWidth', 2, 'MarkerSize', 9, 'MarkerFaceColor', '#1f77b4');
hold on
plot(N_vector, T_a, '-o', 'LineWidth', 2, 'MarkerSize', 9, 'MarkerFaceColor', [0.8500, 0.3250, 0.0980]	);
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');
legend('Without Pre-Allocation', 'With Pre-Allocation', 'Location', 'southeast')
xlabel('Size of the vector')
ylabel('Time (s)')
set(gca,'TickLength',[0.02, 1])
a = gca;
% set box property to off and remove background color
set(a,'box','off','color','none');
% create new, empty axes with box but without ticks
b = axes('Position',get(a,'Position'),'box','on','xtick',[],'ytick',[]);
% set original axes as active
axes(a)
% link axes in case of zooming
linkaxes([a b])
ylim([10^-4, 10^2])
xlim([10^2, 10^10])
hold off
