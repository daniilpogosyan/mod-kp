function [n,x] = sequence (x1, r, N)
  x = zeros(N,1);
  n = 1:N;
  x(1) = x1;
  for k=1:N-1
    x(k+1) = exp(-4.9*x(k)^2) + r;
  end
end