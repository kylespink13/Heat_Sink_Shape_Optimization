function J = objectiveFunction(p, t, U, lambda1, lambda2)
totalArea = 0;
for i = 1:size(t, 2)
    % Extract the vertices of the current triangle
    v1 = p(:, t(1, i));
    v2 = p(:, t(2, i));
    v3 = p(:, t(3, i));

    % Compute the area of the triangle using the shoelace formula
    area = 0.5 * abs(v1(1)*(v2(2) - v3(2)) + v2(1)*(v3(2) - v1(2)) + v3(1)*(v1(2) - v2(2)));

    % Add the area of the current triangle to the total area
    totalArea = totalArea + area;
end %for loop
avgTemp = mean(U); %computes average temperature value

J = (lambda1 * (totalArea / 2)) + (lambda2 * (avgTemp / 372.6330));

end %function