% Data points
n = 9;
xi = [40,41,42,43,44,45,46,47,48];
yi = [7.9, 8.2, 8.6, 8.7, 8.75, 8.78, 8.3, 8, 7.8];

figure
scatter(xi, yi, 80, 'filled') % Plot original data points
hold on

% Linear fit (degree 1)
Sxi = sum(xi);
Sxi2 = sum(xi.^2);
Syi = sum(yi);
Sxiyi = sum(xi.*yi);

A1 = [n, Sxi; Sxi, Sxi2];
b1 = [Syi; Sxiyi];
a1 = A1\b1; % Solve linear system for coefficients
disp('Linear fit coefficients (a0, a1):')
disp(a1)

k = 40:0.1:48;
l1 = a1(1) + a1(2)*k;
plot(k, l1, 'r', 'LineWidth', 2) % Plot linear fit in red

% Quadratic fit (degree 2)
Sxi3 = sum(xi.^3);
Sxi4 = sum(xi.^4);
Sxi2yi = sum((xi.^2).*yi);

A2 = [n, Sxi, Sxi2;
      Sxi, Sxi2, Sxi3;
      Sxi2, Sxi3, Sxi4];
b2 = [Syi; Sxiyi; Sxi2yi];
a2 = A2\b2;
disp('Quadratic fit coefficients (a0, a1, a2):')
disp(a2)

l2 = a2(1) + a2(2)*k + a2(3)*k.^2;
plot(k, l2, 'g', 'LineWidth', 2) % Plot quadratic fit in green

% Cubic fit (degree 3)
Sxi5 = sum(xi.^5);
Sxi6 = sum(xi.^6);
Sxi3yi = sum((xi.^3).*yi);

A3 = [n, Sxi, Sxi2, Sxi3;
      Sxi, Sxi2, Sxi3, Sxi4;
      Sxi2, Sxi3, Sxi4, Sxi5;
      Sxi3, Sxi4, Sxi5, Sxi6];
b3 = [Syi; Sxiyi; Sxi2yi; Sxi3yi];
a3 = A3\b3;
disp('Cubic fit coefficients (a0, a1, a2, a3):')
disp(a3)

l3 = a3(1) + a3(2)*k + a3(3)*k.^2 + a3(4)*k.^3;
plot(k, l3, 'b', 'LineWidth', 2) % Plot cubic fit in blue

% Final plot formatting
legend('Data points', 'Linear fit', 'Quadratic fit', 'Cubic fit', 'Location', 'best')
xlabel('x')
ylabel('y')
title('Polynomial Curve Fitting of Degrees 1, 2, and 3')
grid on
hold off
