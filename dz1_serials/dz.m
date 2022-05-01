
% V-6


              %%part_1
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear all;
%N = 1000;
%x = 0.7;
%%[n, nth_sum] = numSerVec(x, N);
%%plot(n,nth_sum);
%
%
%func = @(x) (1+x)/(1-x)^3;
%abs_err = 1e-5;
%
%max_err = 0;
%N = 555; 
%%should NOT set `xmax` to 1 because `func(1)` -> inf with `N` < inf
%xlim = 0.95;
%for x=-xlim:0.01:xlim
% if abs(numSer(x,N) - func(x)) > max_err 
%   max_err = abs(numSer(x,N) - func(x));
% end
%end
%fprintf('max_err = %.2e, in span x[%.2f, %.2f]\n', max_err,-xlim, xlim);
%
%%FOR STEPIK:
%x = 0.7;
%N = 60;
%
%f = func(x);
%S = numSer(x,N);
%
%fprintf('\nSTEPIK:\nS = %.5f, N = %i\nerror = %.5e\n', S, N, abs(S-f));

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


              %%part_2
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% %x(n+1) = exp(-4.9*x^2) + r   x,r = [-1,1]
% N = 500;
% 
% delta = 1e-3;
% r0 = []; % = `r` at which x(n) tends to zero
% rstat = [];  % =`r` at which x(n) tends to particular number
% x1 = -0.5;
% tic
% for r=-1:0.001:1  
%  [n,x] = sequence(x1, r, N);
%  
%  if (abs(x(end)) < delta) && (abs(x(end)-x(end-1)) < delta)
%    r0 = [r0, r];
%  end
%  if abs(x(end)-x(end-1)) < delta
%    rstat = [rstat, r];  
%  end
% end
% toc
% 
% display(r0); % `r` at which x(n) tends to zero NOT FOUND
% %use `delta` = 0.1 rstep = 0.001
% %use `delta` = 1e-3 rstep = 0.001
% 
% display(rstat); % r = [-1, -0.794] and [0.437, 1]
% %use rstep = 0.001, delta = 1e-3, x1 = -0.5
% %use rstep = 0.001, delta = 1e-3, x1 = 0.5
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

              %%part3
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% a = 1;
% b = 100;
% c = 1;
% d = 100;
% 
% t = 0:0.001:2*pi;
% 
% x = cos(a*t) - cos(b*t).^3;
% y = sin(c*t) - sin(d*t).^3;
% plot(x,y);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%              



