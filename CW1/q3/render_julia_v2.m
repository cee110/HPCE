function [pixels]=render_julia_v2(juliaproc, w,h,c, maxiter)
% render_julia_v2 : Renders julia set using a specified iteration .../
% procedure
% juliaproc : A function of the form [viter,vz] = juliaproc(vz, ...
% c, maxiter)
% where vz can be a vector.
% w,h,c,maxiter : Standard rendering controls

% TODO: Document difference in code time
if nargin < 4
    c = 0.5+0.5i;
end
if nargin < 5
    maxiter=16;
end

function [pixels] = main(w, h)
    pixels=zeros(w,h);

    i=sqrt(-1); % Not really necessary, defined by default

    ox=-1;
    dx=2/w;
    oy=-1;
    dy=2/h;

    for x=1:w
        for y=1:h
            z = (ox+x*dx) + (oy+y*dy)*i;
            pixels(y,x) = juliaproc(z, c, maxiter);
        end
    end
end
pixels = arrayfun(@(A,B)main(A,B), w, h, 'un', 0);
pixels = pixels{1,1};
end
