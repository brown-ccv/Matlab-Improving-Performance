clear all
close all
clc

% Performance scaling for sequential memory access

N_vector = int32(linspace(100, 10000, 10));
T1 = zeros(length(N_vector), 1);
T2 = T1;
T3 = T1;

nruns = 10;

for i = 1:nruns
    for n = 1:length(N_vector)

        N = N_vector(n);
        A = ones(N, N);
        B = ones(N,1);
        C = zeros(N,1);

        tic
        for i = 1:N
            for j= 1:N
                C(i) = A(i,j)*B(i);
            end
        end
        T1(n) = T1(n) +toc;

        tic
        for j = 1:N
            for i = 1:N
                C(i) = A(i,j)*B(i);
            end
        end
        T2(n) = T2(n) + toc;

        tic
        C = A*B;
        T3(n) = T3(n) + toc;
    end
end

set(0,'defaultAxesFontSize',16)
plot(N_vector, T1/nruns, '-o', 'LineWidth', 2, 'MarkerSize', 9, 'MarkerFaceColor', '#1f77b4');
hold on
plot(N_vector, T2/nruns, '-o', 'LineWidth', 2, 'MarkerSize', 9, 'MarkerFaceColor', [0.8500, 0.3250, 0.0980]	);
plot(N_vector, T3/nruns, '-o', 'LineWidth', 2, 'MarkerSize', 9, 'MarkerFaceColor', [0.9290, 0.6940, 0.1250]	);
legend('Random Memory Access', 'Sequencial Memory Access', 'Vectorization', 'Location', 'northwest')
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
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');
% link axes in case of zooming
linkaxes([a b])
hold off
