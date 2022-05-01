%x'' + gam* x' + x / (1+x^2) + 1/4 = 0;
%=> x'' = - gam* x' - x / (1+x^2) - 1/4; 
%x = (x1, x2) = (x, x') --hrs--> y = (x',x'') = (x2, - gam*x2 - omega0^2*x1)

function y = odefun_v6(t, x, gam)
  y = zeros(2,1);
  y(1) = x(2);
  y(2) = - gam*x(2) - x(1) / (1+x(1)^2) - 1/4;
end

