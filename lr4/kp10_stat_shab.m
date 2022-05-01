% Решение стационарного уравнения теплопроводности 
% u_xx + u_yy + q(x, y) = 0 итерациями Якоби.

clear all;

% Входные параметры
nn = 11;  % Число точек по каждой координате

% ##### Задать интервалы по х, у и шаг  h
x = linspace(0,1,nn);
y = linspace(0,1,nn);
h = x(2)- x(1);

niter = 25000;  % макс. количество итераций
delta0 = 1.0e-4;  % погрешность

[X, Y] = meshgrid(x,y);
u0 = (1 ./ cosh((X-0.5).^2 + (Y-0.3).^2))';  % начальное распределение температуры

tic
u = u0;
% Интегрирование ОДУ по t = t0:tend
for iter= 1:niter  
% ##### Найти новую итерацию #####
   unew = iter0(x, y, u, h, nn);

% ###############    

   % Найти среднюю абс.разность между текущей и новой итерациями
   if !mod(iter, 1000)
     disp(iter)
   endif
   dlt = sum(sum(abs(u - unew)));
   u = unew; 
   if dlt < delta0 
      break;
   end
end
toc

iter
% Построить графики функций координаты и скорости
tic
figure
surf(x, y, unew');
title(strcat('graph for ', num2str(nn)));
xlabel('x')
ylabel('y')
colorbar
colormap cool
toc