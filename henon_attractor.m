% Hénon attractor
% x(t+1) = y(t) + 1 - 1.4x(t)^2
% y(t+1) = 0.3x(t)

% Number of loop iterations
iterations = 10000;

% Initial conditions
x0 = 1.0;
y0 = 1.0;

% Create figure and put all points on it
figure
hold on

% Computation step
x_prev = x0;
y_prev = y0;

for i = 0:iterations
    x_next = y_prev + 1 - 1.4 * x_prev^2;
    y_next = 0.3 * x_prev;

    x_prev = x_next;
    y_prev = y_next;

    fprintf("Iteration %d: (x, y): (%f, %f)\n", i, x_next, y_next);

    plot(x_next, y_next, '.', Color="#00ffff");
end

axis([-1.5 1.5 -0.5 0.5])