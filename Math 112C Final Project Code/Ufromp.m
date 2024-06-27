function [U, R] = Ufromp(p, e, t, k, h, Tambient, Tsink)
% Construct Stiffness Matrix & Load Vector
[K, F] = constructStiffnessMatrixLoadVector(p, t, k);

% Apply Boundary Conditions
[K, F] = applyBoundaryConditions(K, F, e, p, h, k, Tambient, Tsink);

% Solve the System
U = solveSystem(K, F);

end