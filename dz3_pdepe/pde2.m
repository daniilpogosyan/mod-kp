function [c,f,s] = pde2(x, t, u, DuDx)
  c = 1;
  f = DuDx;
  s = (2*x .* (1 + x + x.*t) + (1 + t).^2) / (4 * (1 + x + x.*t)^(3/2));
end