function [evecs evals] = decompose_orthTen(orthTen, trialNum, powerNum)

    r = size(orthTen,1);
    evecs = zeros(r,r);
    evals = zeros(r,1);
    for i=1:r
        [orthTen evecs(:,i) evals(i)] = ...
            deflate(orthTen, trialNum, powerNum);
    end
    
end