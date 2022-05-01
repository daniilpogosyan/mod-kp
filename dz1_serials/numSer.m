% return sum of series of first N terms
function sum = numSer (x, N)
  sum = 0;
  for k=0:N
    xk = (k+1)^2 * x^k;
    sum = sum + xk;
  end
end
