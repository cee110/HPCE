function [] = test_renderer(renderer)
% test_renderer checks that a renderer is functionally correct,
% by checking it against the reference render_julia function
% for various (w,h,c,maxiter) test points.
% The set of test points chosen is up to the implementation,
% and should be chosen to balance likelihood of error detection
% against execution time.
% The function should fail using assert if any test fails, or
% run to completion otherwise.


% Assume code time constraint is 5 minutes because that is all the time the
% boss can give. Business is fast pace. Probably a startup but it could be
% something else. Lets assume that the max maxiter is 64 and the max width
% and height are 128. From the plot of number of pixels vs time, we know
% that t = 0.0000117n - 0.0008029. 

% compare renderer with render_julia
w = 2:14:128;
h = w;
c = 0:0.05:1;
maxiter = 64;
function [] = run_render0(wt,ht)
    function [] = run_render1(ct)
    assert(isequal(renderer(wt,ht,ct,maxiter),render_julia(wt,ht,ct,maxiter)),...
    'render is incorrect');
    end
    arrayfun(@(A)(run_render1(A)), c);
end

arrayfun(@(A,B)(run_render0(A,B)),w,h);

end