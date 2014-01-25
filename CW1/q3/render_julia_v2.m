function [pixels]=render_julia_v1(w,h,c, maxiter)

if nargin < 3
    c = 0.5+0.5i;
end
if nargin < 4
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
            pixels(y,x) = julia_v1(z, c, maxiter);
        end
    end
end
pixels = arrayfun(@(A,B)main(A,B), w, h, 'un', 0);
end
