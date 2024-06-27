function [K, F] = applyBoundaryConditions(K, F, e, p, h, k, Tambient, Tsink)

% Implements Convective Boundary Conditions
for edge = 1:size(e, 2)
    if e(6, edge) == 0 || e(7, edge) == 0
        n1 = e(1, edge);
        n2 = e(2, edge);

        x1 = p(1, n1);
        y1 = p(2, n1);
        x2 = p(1, n2);
        y2 = p(2, n2);

        edgeLength = sqrt((x2 - x1)^2 + (y2 - y1)^2); %length of the edge

        % Implement convective boundary conditions with the load vector
        F(n1) = F(n1) + (h/k) * Tambient * edgeLength / 2;
        F(n2) = F(n2) + (h/k) * Tambient * edgeLength / 2;

        % Implement convective boundary conditions with the global stiffness matrix
        K(n1, n1) = K(n1, n1) + (h/k) * edgeLength / 3;
        K(n1, n2) = K(n1, n2) + (h/k) * edgeLength / 6;
        K(n2, n1) = K(n2, n1) + (h/k) * edgeLength / 6;
        K(n2, n2) = K(n2, n2) + (h/k) * edgeLength / 3;
    end %if statement
end %for loop

% Dirichlet Boundary Conditions (Fixed Temperature at Contact Area)
for i = 1:size(p, 2)
    if p(2, i) == 0
        K(i, :) = 0;
        K(i, i) = 1;
        F(i) = Tsink;
    end %if statement
end %for loop
end %function
