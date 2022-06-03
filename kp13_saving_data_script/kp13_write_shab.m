% �������� ������� � ������� � ����
clear all
% ��������� ������� ��� ��������� ���������� �����
q_vn = @(x, y) x + y;

% ������ ������� � � �
x = [1, 2, 3, 4, 5];
y = [6, 7, 8, 9];
nx = length(x);  ny = length(y);  

% nn = 21;   
% x = linspace(0, 1, nn);  % ����� �� �
% y = linspace(0, 1, nn);  % ����� �� �

% ������������ ������� matr1 = {xj, yk, u_jk}
matr1 = [];


for kx=1:length(x)
  for ky=1:length(y)
    matr1 = [matr1; x(kx), y(ky), q_vn(x(kx), y(ky))];
  end
end


% #####


% ��������� ������� matr1 � �����
dlmwrite('tst.dat', matr1);

save('viaSave.mat', 'matr1')

clear all

load('viaSave.mat', 'matr1')

