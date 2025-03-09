%% System definition and phase portrait

% System definition
function dydt = lorenz(~, y)
    % Parameters
    sigma = 10;
    beta = 8 / 3;
    rho = 28;

    % Equation system
    dy1 = sigma * (y(2) - y(1));
    dy2 = rho * y(1) - y(1) * y(3) - y(2);
    dy3 = y(1) * y(2) - beta * y(3);

    % Return value
    dydt = [dy1; dy2; dy3];
end

% Initial conditions
y0 = [1; 1; 1];

% Simulation time span
t = [0 1000];

% Solve
[t, y] = ode45(@lorenz, t, y0);

% Phase space
figure;
plot3(y(:, 1), y(:, 2), y(:, 3));
xlabel("x");
ylabel("y");
zlabel("z");
title("Phase portrait for the Lorenz attractor");
grid on;

%% Time series
figure;
plot(t, y(:, 1));
xlabel("t");
ylabel("x");
title("Time series for x");
axis([0 50 -20 20]);

figure;
plot(t, y(:, 2));
xlabel("t");
ylabel("y");
title("Time series for y");
axis([0 50 -30 30]);

figure;
plot(t, y(:, 3));
xlabel("t");
ylabel("z");
title("Time series for z");
axis([0 50 0 50])

%% Power spectra
[p, f] = pspectrum(y(:, 1));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for x");

[p, f] = pspectrum(y(:, 2));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for y");

[p, f] = pspectrum(y(:, 3));
figure;
plot(f, pow2db(p));
xlabel("\omega");
ylabel("P(\omega)");
title("Power spectrum for z");

%% Poincaré section
function [value, isterminal, direction] = poincare_section(~, y)
    value = y(2) - 0;
    isterminal = 0;
    direction = 1;
end

function [t, y, event_t, event_y, event_index] = poincare_map(odefun, event, tspan)
    options = odeset('Events', event, 'RelTol', 1e-4, 'AbsTol', 1e-6);
    [t, y, event_t, event_y, event_index] = ode45(odefun, tspan, y(end, :), options);
end

event = poincare_section(t, y);

[t, y, event_t, event_y, event_index] = poincare_map(@lorenz, event, t + 1000);