function[t,n,w,h,c,maxiter] = calc_render(renderer,w,h,c,maxiter)
%Expects scalar quantities
id = tic();
renderer(w,h,c,maxiter);
t = toc(id);
n = w*h;
end