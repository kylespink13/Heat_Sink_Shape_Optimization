function [p, e, t, meshSize, contactNodes, innerNodes, designVariableIndices] = initializeGeometry(meshSize)
% Import 2D Geometry From .stl File
importedGeometry = fegeometry("Math_112C_Rectangular_Heat_Sink.stl");

% Mesh Generation
initalMesh = generateMesh(importedGeometry, 'Hmax', meshSize, 'GeometricOrder', 'linear'); %generates mesh from imported geometry
[p, e, t] = meshToPet(initalMesh.Mesh); %extracts data from mesh

% Boundary Nodes
boundaryEdgeIndices = find(e(6,:) == 0 | e(7,:) == 0); %creates indices of all points on the boundary of the geometry
for i = 1:size(p, 2)
    if p(2, i) < 0.001 && p(2, i) > -0.001
        p(2, i) = round(p(2, i));
    end %if statement
end %for loop

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
    end %if statement
end %for loop

% Design Variables
designVariables = []; %initialize designVariables as an empty array

for i = 1:size(boundaryNodes, 2)
    % Check if the boundary node is not on the left or right edge (x not equal to -1 or +1)
    % and the boundary node is on the top side (y coordinate is not 0)
    if boundaryNodes(1, i) ~= -1 && boundaryNodes(1, i) ~= 1 && boundaryNodes(2, i) ~= 0
        % Append the boundary node to designVariables
        designVariables = [designVariables, boundaryNodes(:, i)];
    end %if statement
end %for loop
 
% Get all indices of p where elements are in designVariables
designVariableIndices = zeros(1, size(p, 2));
indexCounter = 0; %initialize counter
for i = 1:size(p, 2)
    if ismember(p(:, i)', designVariables', 'rows')
        indexCounter = indexCounter + 1;
        designVariableIndices(indexCounter) = i;
    end %if statement
end %for loop

% Trim the Unused Preallocated Space
designVariableIndices = designVariableIndices(1:indexCounter);

end %function