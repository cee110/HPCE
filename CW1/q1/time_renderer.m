function [T,N,W,H,c,maxiter] = time_renderer(renderer,varargin)
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

if nargin < 2
    w = (2.^(4:0.5:10));
else
    w = varargin{1,1};
end
if nargin < 3
    h = w;
else
    h = varargin{1,2};
end
if nargin < 4
    c = sqrt(2);
else
    c = varargin{1,3};
end
if nargin < 5
    maxiter = 64;
else
    maxiter = varargin(4);
end

% Define closure function
% either c or n,w and h vary. Not both sets at the same time.
% either one input c or two w and h
function[t,n,wt,ht] = calc_render(varargin)
    if nargin == 1
        wt = w; ht = h; ct = varargin{1,1};
    end
    if nargin == 2
        wt = varargin{1,1}; ht = varargin{1,2}; ct = c;
    end
    %suppress size warning
    ct = ceil(ct);
    wt = ceil(wt);
    ht = ceil(ht);
    
    %Expects scalar quantities
    id = tic();
    renderer(wt,ht,ct,maxiter);
    t = toc(id);
    n = wt*ht;
end

if length(c) == 1 %i.e c is a scalar 
    [T,N,W,H] = arrayfun(@(A,B)calc_render(A,B), w, h);
else
    [T,N,W,H] = arrayfun(@(A)calc_render(A), c);
end
end