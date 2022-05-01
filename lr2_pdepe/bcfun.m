%boundary conditions
function [pl, ql, pr, qr] = bcfun(xl, ul, xr, ur, t)
  pl = ul - exp(t);
  ql = -1;
  pr = ur - exp(1-t);
  qr = 1;
end