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

% Phase plane
figure;
plot3(y(:, 1), y(:, 2), y(:, 3));
grid on;