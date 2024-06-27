function psi = computePsi(JUp, JDown, UUp, UDown, K)
partialJ_partialU = (JUp - JDown) / (UUp - UDown); %finite differences for partialJ/partialU
psi = K \ (-partialJ_partialU'); %calculates psi
end %function