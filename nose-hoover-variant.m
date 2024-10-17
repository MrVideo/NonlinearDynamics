% This is a variant of the Nosé-Hoover oscillator.
% There are several others, however this looks interesting
% when plotted.
% The initial condition (0, 5, 0) is simpler but just
% as interesting to look at.

function dxdt = torus(~, x)
    % Define parameters
    a = 5;

    % Define equation system
    dx1 = x(2);
    dx2 = -x(1) + x(2) * x(3);
    dx3 = a - x(2)^2;

    % Return vector
    dxdt = [dx1; dx2; dx3];
end

% Initial conditions
% x0 = [0; 5; 0];
x0 = [2; 3; 1];

% Simulation time
t = [0 1000];

% Solve
[t, x] = ode45(@torus, t, x0);

% Plot phase plane
figure;
plot3(x(:, 1), x(:, 2), x(:, 3));
grid on;