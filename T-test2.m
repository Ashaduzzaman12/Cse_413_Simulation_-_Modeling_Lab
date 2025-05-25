%Mohammomad Masud Chowdhury Mahir
%two sample t-test
format long g;   
val1=[82,85,90,88,91,87];
val2=[80,83,88,86,90,85];

[h,p,ci,stats]=ttest2(val1,val2);

disp("T-stat");
disp(stats.tstat);
disp("Degree of Freedom");
disp(stats.df);
disp("p-value");
disp(p)

if h==1
    disp("Reject the null hypothesis");
else
    disp("Didn't reject the null hypothesis");
end


figure;
hold on;

% Plot histograms
histogram(val1, 'BinWidth', 2, 'FaceColor', 'b', 'FaceAlpha', 0.5);
histogram(val2, 'BinWidth', 2, 'FaceColor', 'r', 'FaceAlpha', 0.5);

% Add means
line([mean(val1), mean(val1)], ylim, 'Color', 'b', 'LineWidth', 2, 'LineStyle', '--');
line([mean(val2), mean(val2)], ylim, 'Color', 'r', 'LineWidth', 2, 'LineStyle', '--');

% Formatting
title('Comparison of Two Samples');
xlabel('Values');
ylabel('Frequency');
legend({'Sample 1', 'Sample 2', 'Mean 1', 'Mean 2'});
grid on;
hold off;

% Create side-by-side bar plot
figure;
bar([val1', val2']);
title('Side-by-Side Comparison');
xlabel('Observation');
ylabel('Value');
legend({'Sample 1', 'Sample 2'});
grid on;
