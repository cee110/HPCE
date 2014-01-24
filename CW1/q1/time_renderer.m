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
    w = varargin(1);
end
if nargin < 3
    h = w;
else
    h = varargin(2);
end
if nargin < 4
    c = sqrt(2);
else
    c = varargin(3);
end
if nargin < 5
    maxiter = 64;
else
    maxiter = varargin(4);
end

%vectorised implementation
% Create empty vectors for output
% Create a combination of w's and h's
wlen = length(w);
hlen = length(h);
wbar = repmat(w, ones(1,hlen));
wbar = wbar(:)';
wbar = ceil(cell2mat(wbar));
hbar = repmat(h, [1, wlen]);
hbar = ceil(cell2mat(hbar));
cbar = repmat(c, [1, wlen*hlen]);
cbar = ceil(cell2mat(cbar));
maxiterbar = repmat(maxiter, [1, wlen*hlen]);



% Define closure function
function[t,n,w,h,c,maxiter] = calc_render(w,h,c,maxiter)
%Expects scalar quantities
id = tic();
renderer(w,h,c,maxiter);
t = toc(id);
n = w*h;
end

[T,N,W,H,c,maxiter] = arrayfun(@(A,B,C,D)calc_render(A,B,C,D), wbar, hbar, cbar, maxiterbar);

end