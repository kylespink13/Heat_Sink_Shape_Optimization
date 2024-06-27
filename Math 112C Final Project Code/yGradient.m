function pNew = yGradient(designVariables, designVariableIndices, p, partialJ_partialp, psi, partialR_partialP, learningRate)
yOld = designVariables(2, :);
dJ_dP = partialJ_partialp + (psi' .* partialR_partialP);
dJ_dP = dJ_dP(1, :);

dJ_dP = dJ_dP(designVariableIndices);

y = yOld - learningRate .* dJ_dP(:, 1)';
pNew = p;

pNew(2, designVariableIndices) = y;


x = pNew(1,:)';
y = pNew(2,:)';
[G, area] = boundary(x, y);


DT = delaunayTriangulation(x, y);

% Calculate side lengths for all triangles
triangles = DT.ConnectivityList;
numTriangles = size(triangles, 1);
sideLengthThreshold = 0.06; % Adjust this threshold as needed

% Loop over all triangles
trianglesToKeep = true(numTriangles, 1);
for i = 1:numTriangles
    % Get vertices of the current triangle
    vertices = triangles(i, :);
    % Calculate lengths of the three sides
    side1 = norm([x(vertices(2)) - x(vertices(1)), y(vertices(2)) - y(vertices(1))]);
    side2 = norm([x(vertices(3)) - x(vertices(2)), y(vertices(3)) - y(vertices(2))]);
    side3 = norm([x(vertices(1)) - x(vertices(3)), y(vertices(1)) - y(vertices(3))]);
    
    % Check if any side length exceeds the threshold
    if side1 > sideLengthThreshold || side2 > sideLengthThreshold || side3 > sideLengthThreshold
        % If any side length is too long, mark the triangle for removal
        trianglesToKeep(i) = false;
    end
end

% Remove triangles with sides that are too long
DT_filtered = triangulation(triangles(trianglesToKeep, :), x, y);

% Plot the resulting triangulation (optional)
triplot(DT_filtered);

% x_boundary = x(G);
% y_boundary = y(G);

% polyshape = polyshape(x_boundary, y_boundary)
% T = triangulation(polyshape);
% triplot(T)
end