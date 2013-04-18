function [T_M1_M2_M3] = mult_tensor(T, M1, M2, M3)

    [n1 n2 n3] = size(T);
    m1 = size(M1, 2);
    m2 = size(M2, 2);
    m3 = size(M3, 2);
    
    T_M1_M2_M3 = zeros(m1, m2, m3);
    for i=1:m1
        for j=1:m2
            for k=1:m3
                val = 0;
                for z1=1:n1
                    for z2=1:n2
                        for z3=1:n3
                            val = val + T(z1,z2,z3) ...
                                      * M1(z1,i) ...
                                      * M2(z2,j) ...
                                      * M3(z3,k);
                        end
                    end
                end
                T_M1_M2_M3(i,j,k) = val;
            end
        end
    end                     
    
end