% Reads .csv File to Plot Area, Average Temperature, and Objective Function
% vs. Iterations

heatSinkData = readmatrix('heatSinkData.csv'); %manually created .csv file

iterations = heatSinkData(:, 1);
area = heatSinkData(:, 2);
avgTemperature = heatSinkData(:, 3);
objectiveFunction = heatSinkData(:, 4);

figure(1);
hold on;
subplot(1, 3, 1); %area subplot
plot(iterations, area, '-o');
title('Area vs Iterations');
xlabel('Iterations');
ylabel('Area');
xlim([1, 20]);

subplot(1, 3, 2); %average temperature subplot
plot(iterations, avgTemperature, '-o');
title('Average Temperature vs Iterations');
xlabel('Iterations');
ylabel('Average Temperature');
xlim([1, 20]);

subplot(1, 3, 3); %objective function subplot
plot(iterations, objectiveFunction, '-o');
title('Objective Function vs Iterations');
xlabel('Iterations');
ylabel('Objective Function');
xlim([1, 20]);
hold off;