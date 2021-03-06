function [Iters,vz] = julia_v3(vz, c, maxiter)
    iter=1;
    Iters = ones(length(vz));
    while iter < maxiter
        mask = abs(vz) > 1;
        if (all(mask))
            break;
        end
        temp =vz.^2 + c;
        vz(~mask) = temp(~mask);
        Iters(~mask) = iter;
        iter=iter+1;
    end
end