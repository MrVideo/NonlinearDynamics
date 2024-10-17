% Model, parameters and initial conditions taken from:
%
% "The Double Scroll" by T. Matsumoto et al. (August 1985)
% DOI: 10.1109/TCS.1985.1085791
% https://ieeexplore.ieee.org/document/1085791

% System definition
function dxdt = chua(~, x)
    % Parameters
    C1 = 1/9;
    C2 = 1;
    L  = 1/7;
    G  = 0.7;

    % Equation system
    dx1 = (G * (x(2) - x(1)) - g_func(x(1))) / C1;
    dx2 = (G * (x(1) - x(2)) + x(3)) / C2;
    dx3 = -x(2) / L;

    % Return value
    dxdt = [dx1; dx2; dx3];
end

% Piecewise function for the nonlinear component
function g = g_func(vc1)
    % Parameters
    m0 = -0.5;
    m1 = -0.8;
    Bp = 1;

    % Function
    g = m0 * vc1 + 0.5 * (m1 - m0) * abs(vc1 + Bp) + 0.5 * (m0 - m1) * abs(vc1 - Bp);
end

% Initial conditions
x0 = [0.15264; -0.02281; 0.38127];

% Simulation time span
t = [0 1000];

% Solve
[t, x] = ode45(@chua, t, x0);

% Phase plane
figure;
plot3(x(:, 1), x(:, 2), x(:, 3));
grid on;