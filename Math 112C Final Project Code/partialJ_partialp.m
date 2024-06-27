function partialJ_partialp = partialJ_partialp(JUp, JDown, pUp, pDown)
%calculates partialJ_partialp to be used in dJdp and corrects size to match
% number of design variables

partialJ_partialp = (JUp - JDown) ./ (pUp - pDown); %formula for 
% partialJ_partialP
finite_indices = isfinite(partialJ_partialp); %gets finite values
partialJ_partialp = partialJ_partialp(finite_indices); %extracts only the 
% finite values into a new vector
partialJ_partialp = partialJ_partialp(2:(end - 1), :); %to match size of
% design variables
end %function