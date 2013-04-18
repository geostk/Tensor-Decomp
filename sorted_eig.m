function [sortedU sortedD] = sorted_eig(symMat)

    [unsortedU unsortedD] = eig(symMat);
    sortedD = diag(sort(diag(unsortedD),'descend'));
    [~, ind] = sort(diag(unsortedD),'descend');
    sortedU = unsortedU(:,ind);

end