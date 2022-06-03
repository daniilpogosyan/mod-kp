% Решение уравнения Кортевега-деВриза u_t + beta*u*u_x + gam*u_{xxxx} = 0
% методом разделения по процессам.
close all
% Задать параметры
beta = 7;   gam = 1;
nn = 256;   % полное число точек
x = linspace(-10,10,nn);
xlength = x(end) - x(1);
h = x(2) - x(1);   % шаг по х
t0 = 0.0;  tend = 1; 
dt = 0.4/nn^2;    % шаг по t
nout = 2000;  % nout*h - шаг вывода результатов //nout*dt
nend = round((tend - t0)/dt);  % число временнЫх слоев

% Задать dk и вектор k
dk = 2*pi/(nn*h);
k = [0:dk:nn/2*dk,-(nn/2-1)*dk:dk:-dk];

% Задание начального условия (1 солитон)
a = 1.5;  
x0 = -5;
amp0= 2*a^2;  b0 = a / sqrt(6*gam/beta);
u0 = amp0*sech(b0*(x-x0)).^2;

% Задание начального условия (два солитона)
% a1 = 2;  
% amp0= 2*a1^2;  b0 = a1 / sqrt(6*gam/beta);
% 
% a2 = 1.5;  
% amp1= 2*a2^2;  b1 = a2 / sqrt(6*gam/beta);
% 
% x01 = -5; x02 = -1;
% u0 = amp0*sech(b0*(x+5)).^2 + amp1*sech(b1*(x+1)).^2;

tic
% Инициализация данных для вывода
t = t0;   u = u0;
tdata = t;   udata = u;

U = fft(u);   % Фурье-образ поля u

% to respect 'wrapping' over xspan
wrap_count = 0;
for n = 1:nend
   % Линейный шаг (дисперсия)
   U = U.*exp(1i * gam * k.^3 * dt);
   % Нелинейный шаг
   U = U - 1i*0.5*beta*dt * k .* fft(ifft(U).^2);
   t = t + dt;
   if mod(n,nout) == 0
      u = real(ifft(U)); % обратное Фурье-преобразование 
      tdata = [tdata t];
      udata = [udata; u]; 
      
     % if cur is greater than prev
     % then soliton wrapped once.
     % Yes, I could just look at the graph and do this manually,
     % but still...
     [max_cur, ind_cur] = max(udata(end,:));
     [max_prev, ind_prev] = max(udata(end - 1,:));
     
     if abs(x(ind_prev) - x(ind_cur)) > xlength * 0.05
       wrap_count = wrap_count + 1;
     end
     
   end
end
toc
% Построить графики функций координаты и скорости
figure
mesh(x,tdata,udata)
title(['amp0 = ' num2str(amp0) ', beta = ' num2str(beta) ', gam = ' num2str(gam)])
% title(['a1 = ' num2str(a1) ', a2 = ' num2str(a2)]) % for 2 solitons
xlabel('x')
ylabel('t')

% % Найти координаты центра в начальный и конечный моменты,
% % определить скорость

% the last value of u, as if it's span was infinite
    
[x_end, ind_end] = max(udata(end,:));

x_end_extended = x(ind_end) + (xlength * wrap_count);

speed = calcSpeed(x0,t0, x_end_extended, tdata(end));
fprintf('a = %.2f\namp = %.2f\nspeed = %.2f\n',...
    a, amp0, speed)


