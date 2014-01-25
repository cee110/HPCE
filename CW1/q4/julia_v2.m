function [Iters,z] = julia_v2(z, c, maxiter)
    iter=1;
    Iters = ones(length(z));
    while iter < maxiter
        mask = abs(z) > 1;
        if (all(mask))
            break;
        end
        z=z.^2 + c;
        Iters(~mask) = iter;
        iter=iter+1;
    end
end
