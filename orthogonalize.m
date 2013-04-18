function [orthTen, W] = orthogonalize(symTen, symMat, r)

    [U D] = sorted_eig(symMat);
    Ur = U(:,1:r);
    Dr = D(1:r,1:r);
    W = Ur / sqrtm(Dr);

    orthTen = mult_tensor(symTen, W, W, W); 
    
end