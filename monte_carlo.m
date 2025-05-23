demand = [0, 15, 25, 35, 45, 50];
prob = [0.01, 0.15, 0.20, 0.50, 0.12, 0.02];

for i = 1:length(demand)
    disp(demand(i));
end

total = sum(demand);
c_prob = cumsum(prob);

rnum = [48, 78, 09, 51, 56, 77, 15, 14, 68, 9];

% Initialize variables
daily_stock = zeros(1, 10);
production = 35;
simulated_demand = zeros(1, 10);
shortage = zeros(1, 10);
starting_stock = 0;

current_stock = starting_stock;
% Simulate for 10 days
for day = 1:10
    r = rnum(day)/100; % Convert to 0-1 scale
    
    % Determine demand based on random number
    if r <= c_prob(1)
        simulated_demand(day) = demand(1);
    elseif r <= c_prob(2)
        simulated_demand(day) = demand(2);
    elseif r <= c_prob(3)
        simulated_demand(day) = demand(3);
    elseif r <= c_prob(4)
        simulated_demand(day) = demand(4);
    elseif r <= c_prob(5)
        simulated_demand(day) = demand(5);
    else
        simulated_demand(day) = demand(6);
    end
    
    available = current_stock + production;
    if simulated_demand(day) <= available
        daily_stock(day) = available - simulated_demand(day);
    else
        daily_stock(day) = 0; % Stock out
    end
    current_stock = daily_stock(day);
end

avg_demand = mean(simulated_demand);
avg_stock = (mean(stock))/10;
stockout_days = sum(daily_stock == 0);

% Display results
disp('Day  Random#  Demand  Production  Ending_Stock');
disp('---------------------------------------------');
for day = 1:10
    fprintf('%2d    %5d    %5d    %5d       %5d\n', ...
            day, rnum(day), simulated_demand(day), production, daily_stock(day));
end

% Display summary statistics
disp(" ");
disp("Simulation Results:");
fprintf("Average daily demand: %.2f cakes\n", avg_demand);
fprintf("Average Daily stock level: %.2f cakes\n", avg_stock);
fprintf("Production level: %d cakes/day\n", production);
fprintf('Maximum Stock Level: %d cakes\n', max(daily_stock));
