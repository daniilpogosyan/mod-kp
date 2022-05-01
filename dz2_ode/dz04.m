%%%%%%%%% part1 %%%%%%%%%
%% use `eps` to avoid zero-division error
xspan = linspace(eps, 10, 100);

yth = exp(sqrt(xspan));
y0 = 1; %mistake in the table?
opts = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);

ode1 = @(x,y) y ./ (x + 2*log(abs(y)) - log(abs(y)).^2);
[x,y] = ode45(ode1, xspan, y0, opts);

hold on
plot(xspan,yth, 'r', 'LineWidth', 2);
plot(x,y,'g--', 'LineWidth', 2);
hold off
legend('theoretical solution', 'numerical integration');

print -djpg graph1
meanAbsErr = mean(abs(yth - y'))

%%%%%%%%% part2 %%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%xspan = linspace(0, 10, 100);
%
%% Theoretical solution
%uth = cos(xspan) + atan(xspan);
%
%u0 = [1, 1];
%opts = odeset('RelTol', 1e-6, 'AbsTol', 1e-6);
%
%% Numerical integration
%[x, u] = ode45(@ode2, xspan, u0, opts);
%
%hold on
%plot(xspan,uth, 'r', 'LineWidth', 2);
%plot(x,u(:,1),'g--', 'LineWidth', 2);
%hold off
%legend('theoretical solution', 'numerical integration');
%
%% Find mean absolute error
%mean(abs(uth - u(:,1)'))