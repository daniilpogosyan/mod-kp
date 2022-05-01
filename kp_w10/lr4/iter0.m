function  unew = iter0(x, y, u, h, nn)
% ���� �������� ��� ������������� ���������  u_xx + u_yy + q(x,y) =0.
% ����.������� � ����� a*u_n + b*u = f

% (aTz + bT )G = f
uB = 10;   % ������ ������� 
aL = 1;  bL = 0;  fL = 0;   % ����� �������
aR = 1;  bR = 0;  fR = 0;  % ������ �������

aT = 1; bT = 8;   fT = 400;   % ������� �������

unew  = u;
q_vn = @(x,y) 1100*(sin(3*x) + cos(4*y));  % ��������� ����������/������ �����

hs = h*h;
% ������ ���� �� �
for i = 1:nn
   unew(i,1) = uB;
end
% ���������� ���� �� �
for j = 2:nn-1
   % ����� ������� �� � 
   unew(1,j) = ((-2*fL + aL*q_vn(x(1), y(j))*h)*h +...
       aL*(u(1,j-1) + 2*u(2,j) + u(1,j+1))) /...
       (4*aL - 2*bL*h); 
   % ���������� ����� �� � 
   for i = 2:nn-1
      unew(i,j) = 0.25 * ...
          (u(i+1,j) + u(i-1,j) + u(i,j+1) + u(i,j-1) + hs*q_vn(x(i),y(j)));
   end
   % ������ ������� �� � 
   unew(nn,j) = ((2*fR + aR*q_vn(x(nn), y(j))*h)*h +...
       aR*(u(nn,j-1) + 2*u(nn-1,j) + u(nn,j+1))) /...
       (4*aR + 2*bR*h);
end
% ������� ���� �� �
for i = 2:nn-1
   unew(i,nn) = ((2*fT + aT*q_vn(x(i), y(nn))*h)*h +...
       aT*(u(i-1,nn) + 2*u(i,nn-1) + u(i+1,nn))) /...
       (4*aT + 2*bT*h);
end
% ������� ����� �� ������� ����
unew(1,nn) = 0.5*((2*aL*fT - 2*aT*fL + aL*aT*q_vn(x(1),y(nn))*h)*h + ...
        2*aL*aT*(u(1,nn-1) + u(2,nn))) /(2*aL*aT - aT*bL*h + aL*bT*h); 
unew(nn,nn) = 0.5*((2*aT*fR + 2*aR*fT + aR*aT*q_vn(x(nn),y(nn))*h)*h + ...
        2*aR*aT*(u(nn-1,nn) + u(nn,nn-1))) / (2*aR*aT + aT*bR*h + aR*bT*h); 
% unew(1,nn)= 0.5*(unew(2,nn)+ unew(1,nn-1));
% unew(nn,nn)= 0.5*(unew(nn-1,nn)+ unew(nn,nn-1));
 