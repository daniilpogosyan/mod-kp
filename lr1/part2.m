%%%%% Parameters and initial conditions %%%%%
gamma = 0.15;
beta = 0.5;
omega = 0.8;
u0 = [0,0];
f = 0.1;     % f[0.1, 0.5]

% Stuff for ode45
opts = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
odefun = @(t, u) duffing(t, u, gamma, beta, omega, f);

    
%%%%%%%% Solution  %%%%%%%%%  
tstep = 0.01;
tspan = 0:tstep:200;
[t, u] = ode45(odefun, tspan, u0, opts);
figure
plot(t, u(:,1));
title(['Track, f = ', num2str(f)])  
print -djpg track

%phase space
figure
plot(u(:,1), u(:,2));
title(['Phase space trajectory, f = ', num2str(f)])  
print -djpg phase
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%% Spectral analysis  %%%%%%%%% 
% get rid of pseudo-chaotic part
u_stable = u(floor(length(u)/4):end,1);

ft = fft(u_stable(:,1));
nn = length(u_stable(:,1));
sp2 = abs(ft/nn);
sp1 = sp2(1:floor(nn/2)+1);

df = 2*pi / tstep; 
freq = df*(0:(nn/2)) / nn;

figure
plot(freq, sp1)
title(['Spectrum, f = ', num2str(f)])
xlim([0, 10])
print -djpg spectrum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%% Poincare map %%%%%%%%% 
tstep = 0.5*pi/omega;
tspan = 0:tstep:1000;
[t, u] = ode45(odefun, tspan, u0, opts);

% get rid of pseudo-chaotic part
u_stable = u(floor(length(u)/4):end,:);
figure
plot(u_stable(:,1), u_stable(:,2), '*');
title(['Poincare map, f = ', num2str(f)])  
print -djpg poincare
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%