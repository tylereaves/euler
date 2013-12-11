import math

const n = 600_851_475_143
let max_factor = int(sqrt(float(n)))

var primes: seq[int] = @[2]

proc prime(n:int): bool =
  for x in primes:
    if n mod x == 0:
      return false
  return true

for x in 3..max_factor:
  if prime(x):
    primes.add(x)
    if n mod x == 0:
      echo($x)



