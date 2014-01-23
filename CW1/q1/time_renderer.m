function [t,n,w,h,c,maxiter] = time_renderer(renderer,w,h,c,maxiter)
% time_renderer measures execution time for varying input parameters
% renderer : handle to a function with signature ...
% renderer(w,h,maxiter)
% w,h,c,maxiter : Points at which to measure execution time,
% Each can be a vector or a scalar, but if there ...
% are any
% vectors, then all vectors must have the same ...
% length.
% If no args are specified, the defaults should be
% w=round(2.^(4:0.5:10)); h=w; c=sqrt(2); maxiter=64;
% Returns:
% t : execution time per frame
% n : Total pixels for each frame
% w,h,c,maxiter : Parameters corresponding to each frame.

if nargin < 1
    w = (2.^(4:0.5:10));
end
if nargin < 2
    h = w;
end
if nargin < 3
    c = sqrt(2);
end
if nargin < 4
    maxiter = 64;
end

%naive implementation
%
for i = 1:maxiter
    for j = 1:size(w,1)
        for k = 1:size(h,1)
            id = tic();
            render_julia(w,h,c, maxiter);
            t = toc(id);
            n = w*h;
        end
    end
    id = tic();
    
    
end

end