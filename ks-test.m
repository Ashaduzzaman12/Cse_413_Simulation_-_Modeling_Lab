% ks-test one sample
employee_id = [201:215]';
salary = [52000, 58000, 61000, 47000, 50000, 64000, 56000, 59000, ...
          45000, 48000, 67000, 62000, 52000, 49000, 61000]';

% Parameters for the hypothesized normal distribution
mu = 55000;     % Mean
sigma = 7000;   % Standard deviation

% Standardize the data (since we're testing against a specific normal distribution)
standardized_salary = (salary - mu) / sigma;

% Perform one-sample Kolmogorov-Smirnov test
[h, p, ksstat, cv] = kstest(standardized_salary);

% Display test results
fprintf('Kolmogorov-Smirnov Test Results:\n');
fprintf('Test Statistic (D): %.4f\n', ksstat);
fprintf('Critical Value: %.4f\n', cv);
fprintf('P-value: %.4f\n', p);
fprintf('Hypothesis Test Result (h): %d\n', h);

if h == 1
    fprintf('Conclusion: Reject the null hypothesis (α = 0.05)\n');
else
    fprintf('Conclusion: Fail to reject the null hypothesis (α = 0.05)\n');
end

% Plot empirical CDF vs hypothesized CDF
figure;
hold on;

% Empirical CDF
[f, x] = ecdf(standardized_salary);
stairs(x, f, 'b', 'LineWidth', 2);

% Hypothesized CDF (standard normal)
x_theo = linspace(min(standardized_salary)-1, max(standardized_salary)+1, 1000);
y_theo = normcdf(x_theo, 0, 1);  % Standard normal
plot(x_theo, y_theo, 'r--', 'LineWidth', 2);

legend('Empirical CDF', 'Hypothesized CDF (N(0,1))', 'Location', 'southeast');
xlabel('Standardized Salary');
ylabel('Cumulative Probability');
title('Comparison of Empirical and Hypothesized CDFs');
grid on;
hold off;
