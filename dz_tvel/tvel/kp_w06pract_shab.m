% ������� ��. ���������������� ��� ����� 
% rho*c* u_t = x^{-1} ( x*lam*u_x )_x + q_vn(x)
% r_����= 0.0038,  dlt_He= 0.0005,  dlt_Zr= 0.00065 �.

% global r_table;
% global dlt_He;
% global dlt_Zr;
% 
% r_table = 0.0038;
% dlt_He = 0.0005;
% dlt_Zr = 0.00065;



% ������ ��������� 
m = 1;   tend = 10.0;
x = linspace(0, 0.00495, 200);   % ����� �������� �� � 
t = linspace(0, tend, 100);      % ����� �������� �� t 

% ������ ����� � ������ ���
options= odeset('RelTol',1e-7,'AbsTol',1e-7);
sol = pdepe(m, @pde_tvel, @ic_tvel, @bc_tvel, x, t, options);
% �������� 1-� ���������� ������� � ���������� u.
u = sol(:,:,1);

% ������ ������ u(x, t).
%subplot(2,1,1)
surf(x,t,u) 
%colormap summer
colorbar
title('������������� ����������� �����')
xlabel('radius');
ylabel('time');


% ������� ������� � ��������� � �������� ������� �������
figure(2)
% subplot(2,1,2)
plot(x, u(1,:), x, u(end,:));
title(['����������� ����� t=0 � t= ' num2str(tend)]);
xlabel('radius');
ylabel('temperature');

