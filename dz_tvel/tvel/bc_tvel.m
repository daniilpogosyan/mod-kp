function [pl,ql,pr,qr] = bc3(xl,ul,xr,ur,t)
% Граничные условия для урав. теплопроводности с источником (Практ, 2)
pl = 0;
ql = 1;
pr = ur - 600;
qr = 0;
end
