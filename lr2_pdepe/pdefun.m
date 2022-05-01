function [c,f,s] = pdefun(x, t, u, DuDx)
  c = 1;
  f = DuDx;
  s = -sinh(x - t') - cosh(x - t');
end