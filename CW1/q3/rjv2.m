function [ f ] = rjv2( jp )
f=@(w,h,c,maxiter)( render_julia_v2(jp, w,h,c,maxiter) );
end