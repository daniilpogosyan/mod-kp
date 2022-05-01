% % 1. Решение ур. теплопроводности u_t = u_{xx} при разных
% % граничных условиях
% 
% % Задаем параметры 
% m = 0;   tend = 10.0;
% x = linspace(0, 1, 100);   % Задать 100 точек от 0 до 1
% t =  linspace(0, tend, 100); % Задать 100 точек от 0 до tend
% 
% % Задаем опции и решаем УЧП
% options= odeset('RelTol',1e-7,'AbsTol',1e-7);
% sol = pdepe(m, @pde1, @ic1, @bc2, x, t, options);
% % Выбираем 1-ю компоненту решения в переменную u.
% u = sol(:,:,1);
% 
% % Строим график u(x, t).
% %subplot(2,1,1)
% surf(x,t,u) 
% %colormap summer
% colorbar
% 
% % Профили решения в начальный и конечный моменты времени
% figure
% %subplot(2,1,2)
% plot(x, u(1,:),  x, u(end,:))


% ===================
% 2. Решение ур. теплопроводности с источником u_t = u_{xx} + f(x, t)

% Задаем параметры 
m = 0;   tend = 10.0;
x = linspace(0, 1, 100);  % Задать 100 точек от 0 до 1
t = linspace(0, tend, 100);  % Задать 100 точек от 0 до tend

% Анонимная функция для точного решение 
u_th = @(x, t) sqrt(1 + x + x * t) ;
   
% Задаем опции и решаем УЧП
options= odeset('RelTol',1e-7,'AbsTol',1e-7);
% sol = pdepe(m,pdefun,icfun,bcfun,xmesh,tspan)
sol = pdepe(m, @pde2, @ic2, @bc2, x, t, options);
% Выбираем 1-ю компоненту решения в переменную u.
u = sol(:,:,1);

% Строим график u(x, t).
% subplot(2,1,1)
surf(x,t,u) 
%colormap summer
colorbar

% % Профили решения в начальный и конечный моменты времени,
% % точное и численное решения
figure
% subplot(2,1,2)
plot(x, u(1,:),  x, u(end,:),  x, u_th(x,0),  x, u_th(x,tend));
title(['Решение при t=0 и t= ' num2str(tend)])
xlabel('иксы')
ylabel('игреки');
