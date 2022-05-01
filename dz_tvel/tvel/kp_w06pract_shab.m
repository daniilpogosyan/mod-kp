% Решение ур. теплопроводности для твела 
% rho*c* u_t = x^{-1} ( x*lam*u_x )_x + q_vn(x)
% r_табл= 0.0038,  dlt_He= 0.0005,  dlt_Zr= 0.00065 м.

% global r_table;
% global dlt_He;
% global dlt_Zr;
% 
% r_table = 0.0038;
% dlt_He = 0.0005;
% dlt_Zr = 0.00065;



% Задаем параметры 
m = 1;   tend = 10.0;
x = linspace(0, 0.00495, 200);   % сетка значений по х 
t = linspace(0, tend, 100);      % сетка значений по t 

% Задаем опции и решаем УЧП
options= odeset('RelTol',1e-7,'AbsTol',1e-7);
sol = pdepe(m, @pde_tvel, @ic_tvel, @bc_tvel, x, t, options);
% Выбираем 1-ю компоненту решения в переменную u.
u = sol(:,:,1);

% Строим график u(x, t).
%subplot(2,1,1)
surf(x,t,u) 
%colormap summer
colorbar
title('Распределение температуры твела')
xlabel('radius');
ylabel('time');


% Профили решения в начальный и конечный моменты времени
figure(2)
% subplot(2,1,2)
plot(x, u(1,:), x, u(end,:));
title(['Температура твела t=0 и t= ' num2str(tend)]);
xlabel('radius');
ylabel('temperature');

