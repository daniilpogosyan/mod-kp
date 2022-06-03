% Записать матрицу с данными в файл
clear all
% Анонимная функция для плотности источников тепла
q_vn = @(x, y) x + y;

% Задаем векторы х и у
x = [1, 2, 3, 4, 5];
y = [6, 7, 8, 9];
nx = length(x);  ny = length(y);  

% nn = 21;   
% x = linspace(0, 1, nn);  % точки по х
% y = linspace(0, 1, nn);  % точки по у

% Сформировать матрицу matr1 = {xj, yk, u_jk}
matr1 = [];


for kx=1:length(x)
  for ky=1:length(y)
    matr1 = [matr1; x(kx), y(ky), q_vn(x(kx), y(ky))];
  end
end


% #####


% Сохранить матрицу matr1 в файле
dlmwrite('tst.dat', matr1);

save('viaSave.mat', 'matr1')

clear all

load('viaSave.mat', 'matr1')

