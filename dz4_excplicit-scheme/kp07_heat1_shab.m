% ������� ��������� ���������������� u_t = u_xx + q(x,t) ����� ������.

clear all;

% ������ �������
u_th = @(x, t) sqrt(1 + x +  t .* x);

% ������� ��������� ��� x, t
h = 0.02;
x = 0:h:1;
t0 = 0;
tend = 2;
dt = 0.0001;

nout = 1000;  % nout*h - ��� ������ �����������
niter = round(tend / dt);  % ������ ���������� ��������

u0 = sqrt(1 + x);  % ��������� �������

t = t0;  u = u0;
% ������������� ������ ��� ������
tdata = t;   udata = u;
% �������������� ��� �� t = t0:tend
tic
for  iter= 1:niter
% ���� ��� �� ����� �����
   % ##### ������� ��� ���: #####    
   u = he_step(x, t, u, h, dt);
   t = t + dt;   
   % ###############          
   
   % ���� iter ������ nout, �� ��������� ����������
   if mod(iter, nout) == 0
      tdata = [tdata, t];
      udata = [udata; u]; 
   end
   
   
end
toc

%% save xtu_data_short.bin x tdata udata;


% % ��������� 3D ������ u(x, t) 
[X, T] = meshgrid(x,tdata);

figure
surf(X,T,udata);
xlabel("x");
ylabel("t");
zlabel("u");


% % ��������� ������� u(x, 0)  �  u(x, tend) 
figure
plot(x, udata(1,:), x, udata(end,:));


