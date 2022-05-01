%calculate values of u in next moment `t(k+1) = t(k) + dt` in every x
function  unew = he_step(x, t, u, h, dt)
% Один шаг по явной схеме для уравнения u_t = u_xx + q(x,t)

nn = length(u);

% Плотность источников тепла
q_ext = @(x, t) - sinh(x-t) - cosh(x-t);   


a = 1;
p = dt*a / h^2;
unew = zeros(size(u));

% Реализация явной схемы для внутр.точек
for j = 2:nn-1
  unew(j)= u(j)+p*(u(j+1)-2*u(j)+u(j-1))+dt*q_ext(x(j),t);
end


% Граничные условия
al = -1 ; bl = 1 ; ql = exp(t); 
ar = 1 ; br = 1 ; qr = exp(1-t);

unew(1) = (al*(4*unew(2)-unew(3))-2*ql*h)/(3*al-2*bl*h);
unew(nn) = (ar*(4*unew(nn-1)-unew(nn-2))+2*qr*h)/(3*ar+2*br*h);
end


