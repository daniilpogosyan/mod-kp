function [pl,ql,pr,qr] = bc2(xl, ul, xr, ur, t)
    pl = ul - 2 - t;
    ql = 2;
    pr = ur - (3 + 2*t) ./ sqrt(2+t);
    qr = 2;
end