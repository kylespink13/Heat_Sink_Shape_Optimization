function Ke = computeLocalStiffnessMatrix(x, y, k)
    area = polyarea(x, y); %area of the triangular mesh

    %gradients of the basis functions
    b = [y(2) - y(3); y(3) - y(1); y(1) - y(2)];
    c = [x(3) - x(2); x(1) - x(3); x(2) - x(1)];

    Ke = (b * b' + c * c') / (4 * area * k); %local stiffness matrix
end