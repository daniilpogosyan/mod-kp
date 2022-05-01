%calculate values of u in next moment `t(k+1) = t(k) + dt` in every x
function  unew = he_step(x, t, u, h, dt)
% Один шаг по явной схеме для уравнения u_t = u_xx + q(x,t)

nn = length(u);

% Плотность источников тепла
q_ext = @(x, t) (2*x .* (1 + x + x.*t) + (1 + t).^2)...
                / (4 * (1 + x + x.*t)^(3/2));              


a = 1;
p = dt*a / h^2;
unew = zeros(size(u));

% Реализация явной схемы для внутр.точек
for j = 2:nn-1
  unew(j)= u(j)+p*(u(j+1)-2*u(j)+u(j-1))+dt*q_ext(x(j),t);
end

% Граничные условия
unew(1) = u(1);
unew(nn) = u(nn);
end
