% Decompose a symmetric tensor using its symmetric matrix
%
%  Input: 
%      symTen = sum_{i=1}^r w_i * mu_i * mu_i' * mu_i'   // n x n x n 
%      symMat = sum_{i=1}^r w_i * mu_i * mu_i'           // n x n 
%           r = rank of symTen
%    trialNum = number of random restarts 
%    powerNum = number of power iterations
%
%  Output: 
%      evecs = [mu_1 ... mu_r]  // n x r
%      evals = [w_1 ... w_r]'   // w_1 >= ... >= w_r
% 
% Author: Karl Stratos
% Date: 4/2013
%__________________________________________________________________________
function [evecs evals] = decompose_symTen(symTen, symMat, ...
                                          r, trialNum, powerNum)

    n = size(symTen,1);                                                          

    [orthTen, W] = orthogonalize(symTen, symMat, r);
    [evecsOrth evalsOrth] = decompose_orthTen(orthTen, trialNum, powerNum);

    unsorted_evecs = zeros(n,r);
    unsorted_evals = zeros(r,1);
    B = pinv(W');
    for i=1:r
        unsorted_evecs(:,i) = evalsOrth(i) * B * evecsOrth(:,i);
        unsorted_evals(i) = 1 / (evalsOrth(i)^2);
    end
    evals = sort(unsorted_evals,'descend');
    [~, ind] = sort(unsorted_evals,'descend');
    evecs = unsorted_evecs(:,ind);

end