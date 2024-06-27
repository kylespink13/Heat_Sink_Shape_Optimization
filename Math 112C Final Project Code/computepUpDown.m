function [pUp, pDown, designVariables] = computepUpDown(p, e, deltap)
boundaryEdgeIndices = find(e(6,:) == 0 | e(7,:) == 0); %creates indices of all points on the boundary of the geometry
for i = 1:size(p, 2)
    if p(2, i) < 0.001 && p(2, i) > -0.001
        p(2, i) = round(p(2, i));
    end
end

boundaryPointIndices = unique([e(1,boundaryEdgeIndices), e(2,boundaryEdgeIndices)]); %ensures no repeated indices
boundaryNodes = p(:, boundaryPointIndices); %creates matrix of boundary node xy coordinates

% Contact Nodes
contactNodeIndices = boundaryNodes(2, :) == 0;
contactNodes = boundaryNodes(:, contactNodeIndices); %selects such boundary nodes

% Inner Nodes
innerNodes = [];
for i = 1:size(p, 2)
    currentColumn = p(:, i);
    if ~ismember(currentColumn', boundaryNodes', 'rows')
        innerNodes = [innerNodes, currentColumn];
    end
end

% Design Variables


designVariables = []; %initialize designVariables as an empty array

for i = 1:size(boundaryNodes, 2)
    % Check if the boundary node is not on the left or right edge (x not equal to -1 or +1)
    % and the boundary node is on the top side (y coordinate is not 0)
    if boundaryNodes(1, i) ~= -1 && boundaryNodes(1, i) ~= 1 && boundaryNodes(2, i) ~= 0
        % Append the boundary node to designVariables
        designVariables = [designVariables, boundaryNodes(:, i)];
    end
end

% Find the indices of the elements in p that correspond to designVariables
indices = ismember(p(2, :), designVariables(2, :));

% Replace those elements in p with the new elements (+0.01)
pUp = p;
pDown = p;
for i = 1:numel(indices)
    if indices(i) == 1
        pUp(2, i) = pUp(2, i) + deltap;
        pDown(2, i) = pDown(2, i) - deltap;
    end
end