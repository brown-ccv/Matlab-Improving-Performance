clear all
clc

n = 800; niter = 40;

x0 = -2;   x1 = 1;
y0 = -1.5; y1 = 1.5;

[x,y] = meshgrid(linspace(x0, x1, n), linspace(y0, y1, n));

c = x + 1i * y;
z = zeros(size(c));
k = zeros(size(c));

for ii = 1:niter
    z   = z.^2 + c;
    k(abs(z) > 2 & k == 0) = niter - ii;
end

figure,
imagesc(k),
colormap hot
axis square