import math

var sums = @[0]

proc proper_divisors(n: int): int =
  var d = @[1]
  let stop = int(n/2)+1
  for x in 2..stop:
    if n mod x == 0:
      d.add(x)
  var sum = 0
  for x in d:
    sum += x
  echo($n, " - ", $sum)
  return sum

for n in 1..10000:
  sums.add(proper_divisors(n))

var amicable = newseq[int]()
var sum = 0
for n in 1..10000:
  #Check if already matched
  if sums[n] == 0:
    continue
  if sums[n] < 10000 and sums[sums[n]] == n:
    if n != sums[n]:
      amicable.add(n)
      amicable.add(sums[n])
      sums[n] = 0 
      sums[sums[n]] = 0
      sum += (n + sums[n])

echo($sum)






