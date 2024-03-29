% ������� ������������� ��������� ���������������� 
% u_xx + u_yy + q(x, y) = 0 ���������� �����.

clear all;

% ������� ���������
nn = 11  % ����� ����� �� ������ ����������

% ##### ������ ��������� �� �, � � ���  h
x = linspace(0,1,nn);
y = linspace(0,1,nn);
h = x(2)- x(1);

niter = 25000;  % ����. ���������� ��������
delta0 = 1.0e-5;  % �����������

[X, Y] = meshgrid(x,y);
u0 = (1 ./ cosh((X-0.5).^2 + (Y-0.3).^2))';  % ��������� ������������� �����������

tic
u = u0;
% �������������� ��� �� t = t0:tend
for iter= 1:niter  
% ##### ����� ����� �������� #####
   unew = iter0(x, y, u, h, nn);

% ###############    

   % ����� ������� ���.�������� ����� ������� � ����� ����������
  
   dlt = sum(sum(abs(u - unew)));
   u = unew; 
   if dlt < delta0 
      break;
   end
end
iter
toc


% ��������� ������� ������� ���������� � ��������
figure
surf(x, y, unew');
title(strcat('graph for nn=', num2str(nn)));
xlabel('x')
ylabel('y')
colorbar
colormap cool

max_u = max(max(unew))
min_u = min(min(unew))
delta0