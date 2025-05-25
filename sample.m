% Real dataset
real_data = [5, 3, 7, 8, 0, 1, 0, 5, 1, 2, 0, 6, 7, 1, 9];

% Generate simulated dataset (15 random integers between 0-12)
simulated_data = randi([0 12], 1, 15);

% Compute statistics for real data
real_stats = struct(...
    'mean', mean(real_data), ...
    'mode', mode(real_data), ...
    'var', var(real_data), ...
    'std', std(real_data), ...
    'range', max(real_data)-min(real_data), ...
    'median', median(real_data));

% Compute statistics for simulated data
sim_stats = struct(...
    'mean', mean(simulated_data), ...
    'mode', mode(simulated_data), ...
    'var', var(simulated_data), ...
    'std', std(simulated_data), ...
    'range', max(simulated_data)-min(simulated_data), ...
    'median', median(simulated_data));

% Display results in a clean table
fprintf('=== Statistics Comparison ===\n');
fprintf('%15s %10s %10s\n', 'Statistic', 'Real', 'Simulated');
fprintf('%15s %10.2f %10.2f\n', 'Mean', real_stats.mean, sim_stats.mean);
fprintf('%15s %10d %10d\n', 'Mode', real_stats.mode, sim_stats.mode);
fprintf('%15s %10.2f %10.2f\n', 'Variance', real_stats.var, sim_stats.var);
fprintf('%15s %10.2f %10.2f\n', 'Std Dev', real_stats.std, sim_stats.std);
fprintf('%15s %10d %10d\n', 'Range', real_stats.range, sim_stats.range);
fprintf('%15s %10.1f %10.1f\n', 'Median', real_stats.median, sim_stats.median);

% Plot histograms with better formatting
figure('Position', [100 100 1200 500]);

subplot(1,2,1);
histogram(real_data, 'BinMethod', 'integers', 'FaceColor', [0.2 0.4 0.8]);
title('Real Emergency Items Data');
xlabel('Number of Items Carried');
ylabel('Number of Motorists');
xlim([-0.5 12.5]);
grid on;

subplot(1,2,2);
histogram(simulated_data, 'BinMethod', 'integers', 'FaceColor', [0.8 0.2 0.2]);
title('Simulated Emergency Items Data');
xlabel('Number of Items Carried');
ylabel('Number of Motorists');
xlim([-0.5 12.5]);
grid on;
