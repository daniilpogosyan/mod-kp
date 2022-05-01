% theoretical solution
function u = utheor(x,t)
  u = cosh(x - t);
end
%%%%%%%%%%%%%%%%%%%%%%%

% initial conditions
function u0 = icfun(x)
  u0 = cosh(x);
end
%%%%%%%%%%%%%%%%%%%%%%%

% boundary conditions
function [pl, ql, pr, qr] = bcfun(xl, ul, xr, ur, t)
  pl = ul - exp(t);
  ql = -1;
  pr = ur - exp(1-t);
  qr = 1;
end
%%%%%%%%%%%%%%%%%%%%%%%

% pdefun
function [c,f,s] = pdefun(x, t, u, DuDx)
  c = 1;
  f = DuDx;
  s = -sinh(x - t') - cosh(x - t');
end
%%%%%%%%%%%%%%%%%%%%%%%

% main script
%1) V6

%2) u t = u xx − sh(x − t) − ch(x − t),
    %u(0, t) − u x (0, t) = e^t 
    %u(1, t) + u x (1, t) = e 1−t 
    %u(x, 0) = ch x
    %u th (x, t) = ch(x − t).


% initial params 
m = 0;   tend = 10.0;
x = 0:0.02:1;
t = 0:0.04:tend;

% for surfaces
[X, T] = meshgrid(x, t);

options = odeset('RelTol',1e-7,'AbsTol',1e-7);
tic
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t, options);
toc
% integration solution
u = sol(:,:,1); %u == [time, x]

% 3) Initial thermal distribution graph:
figure
plot(x, icfun(x))
title('u0 = u(x, 0) (using icfun)');
xlabel('x');
ylabel('u0');

% 4) thermal source graph:
figure
q = -sinh(X-T) - cosh(X-T);
surf(X, T, q);
title('q(x,t)');
xlabel('x');
ylabel('t');

% 5) ---

% 6) u(x,0), u(x,tend), u(x,t) graphs:

figure
plot(x, u(1,:));
title('u(x,0)');
xlabel('x');
ylabel('u(x,0)');


figure
plot(x, u(end,:));
title('u(x,tend)');
xlabel('x');
ylabel('u(x,tend)');


figure
surf(X, T, u);
title('u(x,t)');
xlabel('x');
ylabel('t');


%7) Find max hstep with which integration is still accurate enough
h = 0.01:0.01:0.1;
maxRelErr = 1e-4;
t = 0:0.01:tend;
for k=length(h):-1:h(end)
  x = 0:h(k):1;
  sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t, options);
  u = sol(:,:,1); %u == [time, x]
  
  [X,T] = meshgrid(x, t);
  Uth = utheor(X, T)
  relErr = max(max(abs(Uth - u)./Uth));
  if (relErr < maxRelErr)
    accurate_step = h(k);
    break
  end
end

accurate_step

%%%%%%%%%%%%%%%%%%%%%%%