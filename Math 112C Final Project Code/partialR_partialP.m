function partialR_partialp = partialR_partialp(p, deltap, KUp, KDown, UUp, UDown, FUp, FDown)

partialK_partialp = (KUp - KDown) ./ deltap;
avgU = 0.5 .* (UUp - UDown);
avgK = 0.5 .* (KUp - KDown);
partialU_partialp = (UUp - UDown) ./ deltap;
partialF_partialp = (FUp - FDown) ./ deltap;
partialR_partialp = (partialK_partialp .* avgU) - (partialU_partialp .* avgK) - partialF_partialp;
partialR_partialp = round(partialR_partialp, 3); %rounds to third decimal place

% nonzero_indices = partialR_partialp ~= 0;

% Extract the nonzero elements
% partialR_partialp = partialR_partialp(nonzero_indices);

% Get unique nonzero values

[~, pCols] = size(p);
partialR_partialp = partialR_partialp(1, 1:pCols);
end %function

