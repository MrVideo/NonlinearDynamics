% Define the Barnsley Fern transformations
function v = fractal(a, b, c, d, e, f, x)
    A = [a b; c d];
    B = [e; f];

    v = A * [x(1); x(2)] + B;
end

% Number of iterations
iterations = 10000;

% Initialise figure
figure;
hold on;

% Starting conditions
init = [1; 1];
prev_point = init;

for i=1:iterations
    % Generate random number for probability calculations
    p = randi([1 100], 1);

    % Select correct step
    if p == 1
        next_point = fractal(0, 0, 0, 0.16, 0, 0, prev_point);
    elseif p > 1 && p <= 86
        next_point = fractal(0.85, 0.04, -0.04, 0.85, 0, 1.6, prev_point);
    elseif p > 86 && p <= 93
        next_point = fractal(0.2, -0.26, 0.23, 0.22, 0, 1.6, prev_point);
    else
        next_point = fractal(-0.15, 0.28, 0.26, 0.24, 0, 0.44, prev_point);
    end

    % Plot resulting point
    plot(next_point(1, :), next_point(2, :), Color="g", Marker=".");

    % Continue iteration from previous point
    prev_point = next_point;

    % Progress meter (it just shows that something is actually
    % going on and that MATLAB has not crashed lmao)
    if mod(i, 10) == 0
        fprintf("Progress: %.2f%%\n", i / iterations * 100);
    end
end

% Enable grid
grid on;

% Set axis limits for good looksmodel
axis([-5 5 0 10]);