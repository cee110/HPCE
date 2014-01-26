function [iter,vz] = julia_v1(vz, c, maxiter)

    function [iter, zt] = main_func(zt)        
        iter=1;
        while iter < maxiter
            if abs(zt) > 1
                break;
            end
           zt=zt^2 + c; 
           iter=iter+1;
        end
    end
    [iter, vz] = arrayfun(@(A)(main_func(A)),vz);
end
