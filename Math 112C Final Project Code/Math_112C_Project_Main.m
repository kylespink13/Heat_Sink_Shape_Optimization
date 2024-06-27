%% Finite Element Method for 2D Laplace Equation

% Meta
[k, h, Tambient, meshSize, Tsink, epsilon, maxEpochs, lambda1, lambda2, deltap, learningRate] = metaInitialization();

% Initialize Geometry
[p, e, t, meshSize, contactNodes, innerNodes, designVariableIndices] = initializeGeometry(meshSize);

% Construct Stiffness Matrix & Load Vector
[K, F] = constructStiffnessMatrixLoadVector(p, t, k);

% Apply Boundary Conditions
[K, F] = applyBoundaryConditions(K, F, e, p, h, k, Tambient, Tsink);

% Solve the System
U = solveSystem(K, F);

% Initial Total Area
totalArea0 = 0; %initialize total area
for i = 1:size(t, 2)
    %extract the vertices of the current triangle
    v1 = p(:, t(1, i));
    v2 = p(:, t(2, i));
    v3 = p(:, t(3, i));

    %compute the area of the triangle using the shoelace formula
    area = 0.5 * abs(v1(1)*(v2(2) - v3(2)) + v2(1)*(v3(2) - v1(2)) + v3(1)*(v1(2) - v2(2)));

    %add the area of the current triangle to the total area
    totalArea0 = totalArea0 + area;
end %for loop

avgTemp0 = mean(U); %calculates initial average temperature
plotSolution(p, t, U); %plots temperature distribution

%% Adjoint Method and Shape Evolution

clf; %clears figure

% Perturb Boundary Points
[pUp, pDown, designVariables] = computepUpDown(p, e, deltap);

% Calculate Temperature at Perturbed Boundary Points
UUp = Ufromp(pUp, e, t, k, h, Tambient, Tsink);
UDown = Ufromp(pDown, e, t, k, h, Tambient, Tsink);

% Calculate Objective Function at Perturbed Boundary Points
JUp = objectiveFunction(pUp, t, UUp, lambda1, lambda2);
JDown = objectiveFunction(pDown, t, UDown, lambda1, lambda2);

% Calculate Psi Matrix
psi = computePsi(JUp, JDown, UUp, UDown, K);

% Central Finite Differences for partialJ_partialp
partialJ_partialp = partialJ_partialp(JUp, JDown, pUp, pDown);

% Calculate Stiffness Matrix and Load Vector at Perturbed Boundary Points
[KUp, FUp] = constructStiffnessMatrixLoadVector(pUp, t, k);
[KUp, FUp] = applyBoundaryConditions(KUp, FUp, e, pUp, h, k, Tambient, Tsink);
[KDown, FDown] = constructStiffnessMatrixLoadVector(pDown, t, k);
[KDown, FDown] = applyBoundaryConditions(KDown, FDown, e, pDown, h, k, Tambient, Tsink);

% Central Finite Differences for partialR_partialp
partialR_partialp = partialR_partialp(p, deltap, KUp, KDown, UUp, UDown, FUp, FDown);

% Generate New Mesh Using Gradient Descent Algorithm
pNew = yGradient(designVariables, designVariableIndices, p, partialJ_partialp, psi, partialR_partialp, learningRate);