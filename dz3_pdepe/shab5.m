% % 1. ������� ��. ���������������� u_t = u_{xx} ��� ������
% % ��������� ��������
% 
% % ������ ��������� 
% m = 0;   tend = 10.0;
% x = linspace(0, 1, 100);   % ������ 100 ����� �� 0 �� 1
% t =  linspace(0, tend, 100); % ������ 100 ����� �� 0 �� tend
% 
% % ������ ����� � ������ ���
% options= odeset('RelTol',1e-7,'AbsTol',1e-7);
% sol = pdepe(m, @pde1, @ic1, @bc2, x, t, options);
% % �������� 1-� ���������� ������� � ���������� u.
% u = sol(:,:,1);
% 
% % ������ ������ u(x, t).
% %subplot(2,1,1)
% surf(x,t,u) 
% %colormap summer
% colorbar
% 
% % ������� ������� � ��������� � �������� ������� �������
% figure
% %subplot(2,1,2)
% plot(x, u(1,:),  x, u(end,:))


% ===================
% 2. ������� ��. ���������������� � ���������� u_t = u_{xx} + f(x, t)

% ������ ��������� 
m = 0;   tend = 10.0;
x = linspace(0, 1, 100);  % ������ 100 ����� �� 0 �� 1
t = linspace(0, tend, 100);  % ������ 100 ����� �� 0 �� tend

% ��������� ������� ��� ������� ������� 
u_th = @(x, t) sqrt(1 + x + x * t) ;
   
% ������ ����� � ������ ���
options= odeset('RelTol',1e-7,'AbsTol',1e-7);
% sol = pdepe(m,pdefun,icfun,bcfun,xmesh,tspan)
sol = pdepe(m, @pde2, @ic2, @bc2, x, t, options);
% �������� 1-� ���������� ������� � ���������� u.
u = sol(:,:,1);

% ������ ������ u(x, t).
% subplot(2,1,1)
surf(x,t,u) 
%colormap summer
colorbar

% % ������� ������� � ��������� � �������� ������� �������,
% % ������ � ��������� �������
figure
% subplot(2,1,2)
plot(x, u(1,:),  x, u(end,:),  x, u_th(x,0),  x, u_th(x,tend));
title(['������� ��� t=0 � t= ' num2str(tend)])
xlabel('����')
ylabel('������');
