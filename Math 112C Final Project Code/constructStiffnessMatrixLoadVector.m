function [K, F] = constructStiffnessMatrixLoadVector(p, t, k)
numNodes = size(p, 2); %number of nodes
K = sparse(numNodes, numNodes); %stiffness matrix
F = zeros(numNodes, 1); %load vector

% Computes Local Stiffness Matrix and Global Matrix
for elem = 1:size(t, 2)
    nodes = t(1:3, elem); %node indices of the current element
    x = p(1, nodes); %x-coordinate of the nodes
    y = p(2, nodes); %y-coordinate of the nodes
    Ke = computeLocalStiffnessMatrix(x, y, k);
    %assemble into global stiffness matrix
    for i = 1:3
        for j = 1:3
            K(nodes(i), nodes(j)) = K(nodes(i), nodes(j)) + Ke(i, j);
        end %for loop
    end %for loop
end %for loop
end %function