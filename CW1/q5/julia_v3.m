function [Iters,vz] = julia_v3(vz, c, maxiter)
    iter=1;
    Iters = ones(length(vz));
    while iter < maxiter
        mask = abs(vz) > 1;
        if (all(mask))
            break;
        end
        vz(~mask)=vz(~mask).^2 + c;
        Iters(~mask) = iter;
        iter=iter+1;
    end
end
