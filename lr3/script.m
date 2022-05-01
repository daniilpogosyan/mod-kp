% Решение уравнения теплопроводности u_t = u_xx + q(x,t) явной схемой.

clear all;

% theoretical solution
u_th = @(x, t) cosh(x-t);

h = 0.05
x = 0:h:1;
t0 = 0;
tend = 10;
dt = 0.0001;
nout = 1000;  % nout*h - шаг вывода результатов
niter = round(tend / dt);  % полное количество итераций

u0 = cosh(x);  % начальное условие

t = t0;  u = u0;
% Инициализация данных для вывода
tdata = t;   udata = u;
% Интегрирование ОДУ по t = t0:tend
% % % % % % % % % % % % % % % % % % % % 
tic
for  iter= 1:niter
%  one step of excplicit scheme
   u = he_step(x, t, u, h, dt);
   t = t + dt;   
   
   % save piece of data once in `nout` iteration
   if mod(iter, nout) == 0
      tdata = [tdata, t];
      udata = [udata; u]; 
   end
   
   
end
toc

% % save xtu_data_short.bin x tdata udata;

% 3d plot for the solution via excplicit scheme
[X, T] = meshgrid(x,tdata);

 figure
 surf(X,T,udata);
 title('U(x,t) excplicit scheme');
 xlabel('x');
 ylabel('t');
 zlabel('u');
% % % % % % % % % % % % % % % % % % % % % % 

% % 3d plot for theoretical solution
 tspan = t0:0.05:tend;
 [T,X] = meshgrid(x, tspan);
 th_sol = u_th(X,T);
 figure
 surf(T,X,th_sol);
 title('U(x,t) theoretical solution');
 xlabel('x');
 ylabel('t');
 zlabel('u');

% 2d plots

figure 
title('U(x,0) (theoretical and excplicit scheme');
hold on
plot(x, u_th(0,x), 'r-', 'LineWidth', 3);
plot(x, udata(1,:), 'g--', 'LineWidth', 3);
xlabel('x');
ylabel('u');
legend('theoretical', 'explicit')
hold off

figure 
title('U(x,tend) (theoretical and excplicit scheme');
hold on
plot(x, u_th(x,tend), 'r-', 'LineWidth', 3);
plot(x, udata(end,:), 'g--', 'LineWidth', 3);
xlabel('x');
ylabel('u');
legend('theoretical', 'explicit')
hold off




% estimate relative error 

[X,T] = meshgrid(x, tdata);
relerr = abs( (udata - u_th(X,T)) ./ u_th(X,T) );
max_relerr = max(max(relerr))
mean_relerr = mean(mean(relerr)) 

abserr = abs(udata - u_th(X,T));
max_abserr = max(max(abserr))


