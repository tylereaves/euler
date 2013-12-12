
var sum = 0
var sqsum = 0
for x in 1..100:
  sqsum += x*x
  sum += x
let sumsq = sum * sum

echo($(sumsq - sqsum))
