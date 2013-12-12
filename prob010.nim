import math

const n = 2000000

var primes: seq[int] = @[2]

proc prime(n:int): bool =
  for x in primes:
    if n mod x == 0:
      return false
  return true

var sum = 2

for x in 3..n:
  if x mod 10000 == 0:
    echo($x)
  if prime(x):
    primes.add(x)
    sum += x

echo($sum)



