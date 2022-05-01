function [c,f,s] = pde3(x,t,u,DuDx)
% Коэффициенты в обобщенном уравнении, чтобы получить урав. твела
% rho*c* u_t = x^{-1} ( x*lam*u_x )_x + q_vn(x)
c = rho_c(x);
f = lam(x) .* DuDx;
s = q_vn(x);
end


function c1 = rho_c(x)
  if x < 0.0038
    c1 = 320 * 10.8e3;
  elseif x < 0.0043
    c1 = 5.2 * 10e3 * 0.74;
  else
    c1 = 370 * 6.5e3;
  end
end

function lam1 = lam(x)
  if x < 0.0038
    lam1 = 4;
  elseif x < 0.0043
    lam1 = 0.43;
  else
    lam1 = 21;
  end 
end

function q1 = q_vn(x)
  if x < 0.0038
    q1 = 5e8;
  else
    q1 = 0;
  end
end