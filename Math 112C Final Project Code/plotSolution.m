function plotSolution(p, t, U)
    % Extract Node Coordinates
    x = p(1, :);
    y = p(2, :);

    % Extract Element Connectivity
    elements = t(1:3, :)';

    % Plot Temperature Distribution
    figure;
    hold on;
    trisurf(elements, x, y, U, 'EdgeColor', 'none');
    xlabel('x');
    ylabel('y');
    zlabel('Temperature (K)');
    title('Temperature Distribution');
    ylim([0, 1]);
    colorbar;
    view(2); % 2D view
    % axis equal;
    hold off;
end %function