function [deflatedT evec eval] = deflate(T, trialNum, powerNum)

    r = size(T,1);
    thetas = zeros(r, trialNum);
    
    for trial=1:trialNum        
        % draw a vector from the unit sphere in R^r
        thetas(:,trial) = randn(r,1);
        thetas(:,trial) = thetas(:,trial) / norm(thetas(:,trial));
        
        for iterNum=1:powerNum % power iteration
            vec = mult_tensor(T, eye(r), thetas(:,trial), thetas(:,trial));
            norm_vec = vec / norm(vec);
            thetas(:,trial) = norm_vec;
        end
    end
    
    best_eval = 0;
    best_trial = 1;
    
    for trial=1:trialNum
        this_evec = thetas(:,trial);
        this_eval = mult_tensor(T, this_evec, this_evec, this_evec);
        if this_eval > best_eval
            best_eval = this_eval;
            best_trial = trial;
        end
    end
    
    evec = thetas(:,best_trial);        
    for iterNum=1:powerNum % one more power iteration 
        vec = mult_tensor(T, eye(r), evec, evec);
        norm_vec = vec / norm(vec);
        evec = norm_vec;
    end
    
    eval = mult_tensor(T, evec, evec, evec);
    
    deflatedT = T - eval * outer_tensor(evec, evec, evec);
    
end