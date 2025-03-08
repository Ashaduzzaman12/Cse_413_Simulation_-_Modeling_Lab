la = {'Python', 'C', 'Java', 'JavaScript', 'Others'};
use= [40, 20, 15, 15, 10];


col = jet(numel(languages));

figure;
barc = bar(use, 'FaceColor', 'flat');


for i = 1:numel(la)
    barc.CData(i, :) = col(i, :);
end

xlabel('Programming Languages');
ylabel('Popularity (%)');
title('Popularity of Programming Languages');

grid on;
