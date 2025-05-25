%one sample t-test
format long g;   
val = [98,95,97,96,99,94,92,96,95];
mu = 100;
[h,p,ci,stats] = ttest(val,mu,'alpha',0.05,'tail','left');
disp("Sample Mean");
disp(mean(val));
disp("Sample Standerd Deviation");
disp(std(val));
disp("T-stat");
disp(stats.tstat);
disp("Degree of Freedom");
disp(stats.df);
disp("p-value");   
disp(p);
disp(h)
df = stats.df;
t_critical = tinv(0.05, df);

if (h==1)
    disp("Reject the null hypothesis");
    disp("There is sufficient evidence to conclude that the mean caffeine content is less than 100 mg.");
else
    disp("Didn't reject the null hypothesis");
    disp("There is not sufficient evidence to conclude that the mean caffeine content is less than 100 mg.");   
end

figure;
hold on;

% Plot t-distribution
x = linspace(-7, 3, 1000);
y = tpdf(x, df);
plot(x, y, 'b-', 'LineWidth', 2);

% Mark critical region
x_crit = linspace(-7, t_critical, 100);
y_crit = tpdf(x_crit, df);
fill([x_crit, fliplr(x_crit)], [y_crit, zeros(size(y_crit))], 'r', ...
    'FaceAlpha', 0.3, 'EdgeColor', 'none');

% Minimal annotations
text(-6, 0.2, 'Left-tailed t-test (alpha=0.05)', 'FontSize', 12);
text(-6, 0.15, sprintf('t = %.2f', stats.tstat), 'FontSize', 12);

% Axis limits and labels
xlim([-7 3]);
ylim([0 0.4]);
xlabel('t-value');
ylabel('Density');
box on;
hold off;
