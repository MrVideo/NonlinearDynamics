function dydt = lotka(~, y)
    % Set prey and predator populations
    prey = y(1);
    predator = y(2);

    % Define the equation system
    dPrey = prey * (1 - prey / 6) - 5 * prey * predator / (2 + prey);
    dPredator = 0.5 * 5 * prey * predator / (2 + prey) - predator;

    % Return the result vector
    dydt = [dPrey; dPredator];
end

% Initial conditions
init = [1; 1];

% Simulation time span
t = [0 100];

% Solve
[t, y] = ode45(@lotka, t, init);

% Get population data
prey = y(:, 1);
predator = y(:, 2);

% Plot solutions on the phase plane
figure;
plot(prey, predator);
xlabel("Prey population");
ylabel("Predator population");
title("Lotka-Volterra prey-predator model (phase plane)");
grid on;

% Plot solutions against time
figure;
plot(t, prey, 'b');
hold on;
plot(t, predator, 'r');
xlabel("Time");
ylabel("Populations");
legend("Prey", "Predator");
title("Lotka-Volterra prey-predator model (time graph)");
grid on;