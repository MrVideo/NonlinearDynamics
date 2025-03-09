%% System definition and state portrait

% System definition
function dxdt = rossler(~, x)
    % Parameters
    a = 0.1;
    b = 0.1;
    c = 14;

    % Equation system
    dx1 = - x(2) - x(3);
    dx2 = x(1) + a * x(2);
    dx3 = b + (x(1) - c) * x(3);
    % Return value
    dxdt = [dx1; dx2; dx3];
end

% Initial conditions
x0 = [1; 1; 1];

% Simulation time span
t = [0 1000];

% Solve
[t, x] = ode45(@rossler, t, x0);

% Phase space
figure;
plot3(x(:, 1), x(:, 2), x(:, 3));
xlabel("x");
ylabel("y");
zlabel("z");
title("Phase portrait for the Rossler attractor");
grid on;

%% Time series
figure;
plot(t(1:5000), x(1:5000, 1));
xlabel("t");
ylabel("x");
title("Time series for x");
%axis([0 50 -20 20]);

figure;
plot(t, x(:, 2));
xlabel("t");
ylabel("y");
title("Time series for y");
%axis([0 50 -30 30]);

figure;
plot(t, x(:, 3));
xlabel("t");
ylabel("z");
title("Time series for z");
%axis([0 50 0 50])

%% Power spectra
[p, f] = pspectrum(x(:, 1));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for x");

[p, f] = pspectrum(x(:, 2));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for y");

[p, f] = pspectrum(x(:, 3));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for z");