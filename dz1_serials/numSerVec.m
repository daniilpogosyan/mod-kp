% return [n, sums of n-series of first n terms]
function [n,sum] = numSerVec (x, N)
  sum = zeros(N+1,1);
  n = 0:N;
  % shift `k` -> `k-1` to use `k` as an index in sum (`k` in sum starts from 0)
  for k=1:N
    xk = k^2 * x^(k-1);
    sum(k+1) = sum(k) + xk;
  end
end
