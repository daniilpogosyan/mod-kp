% Решение уравнения теплопроводности u_t = u_xx + q(x,t) явной схемой.

clear all;

% Точное решение
u_th = @(x, t) sqrt(1 + x +  t .* x);

% Входные параметры для x, t
h = 0.02;
x = 0:h:1;
t0 = 0;
tend = 2;
dt = 0.0001;

nout = 1000;  % nout*h - шаг вывода результатов
niter = round(tend / dt);  % полное количество итераций

u0 = sqrt(1 + x);  % начальное условие

t = t0;  u = u0;
% Инициализация данных для вывода
tdata = t;   udata = u;
% Интегрирование ОДУ по t = t0:tend
tic
for  iter= 1:niter
% Один шаг по явной схеме
   % ##### Введите ваш код: #####    
   u = he_step(x, t, u, h, dt);
   t = t + dt;   
   % ###############          
   
   % Если iter кратно nout, то сохранять результаты
   if mod(iter, nout) == 0
      tdata = [tdata, t];
      udata = [udata; u]; 
   end
   
   
end
toc

%% save xtu_data_short.bin x tdata udata;


% % Построить 3D график u(x, t) 
[X, T] = meshgrid(x,tdata);

figure
surf(X,T,udata);
xlabel("x");
ylabel("t");
zlabel("u");


% % Построить графики u(x, 0)  и  u(x, tend) 
figure
plot(x, udata(1,:), x, udata(end,:));


