clear all
clc

n = 800; niter = 40;

x0 = -2;   x1 = 1;
y0 = -1.5; y1 = 1.5;

x = linspace(x0, x1, n);
y = linspace(y0, y1, n);

for xi = 1:length(x)
    for yi = 1:length(y)
        c(yi, xi) = x(xi) + 1i * y(yi);
    end
end

z = zeros(size(c));
k = zeros(size(c));

for ii = 1:niter
    for i = 1:length(x)
        for j = 1:length(y)
            z(j, i)   = z(j, i)^2 + c(j, i);
        end
    end
    k(abs(z) > 2 & k == 0) = niter - ii;
end

figure,
imagesc(k),
colormap hot
axis square