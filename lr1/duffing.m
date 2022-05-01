%ü + γ u̇ + β u(1 − u^ 2 ) = f cos(ω t).
function y = duffing(t, u, gamma, beta, omega, f)
  y = zeros(2,1);
  y(1) = u(2);
  y(2) = f*cos(omega*t) - gamma*u(2) - beta*(u(1) - u(1).^3);
end

