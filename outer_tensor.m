function [T] = outer_tensor(v1, v2, v3)
    n1 = length(v1);
    n2 = length(v2);
    n3 = length(v3);
    T = zeros(n1,n2,n3);
    for i=1:n1
        for j=1:n2
            for k=1:n3
                T(i,j,k) = v1(i) * v2(j) * v3(k);
            end
        end
    end
    
end