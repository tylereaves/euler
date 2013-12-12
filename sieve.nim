import math

proc primes*(target: int): seq[int] =
  #Not fully optimal (it checks evens)
  let sz = int(ceil(target/2))
  var sieve = newseq[bool](sz)
  let maxv = target
  let stop = int(sqrt(float(target)))
  var n = 2
  result.add(2)
  while n < stop:
    let start = n*n
    for x in countup(start,target,n):
      sieve[(x-3) /% 2] = true

    let p = sieve.find(false)
    if p == -1:
      break
    sieve[p] = true
    result.add((p*2)+3)
    n = p
    if n >= stop:
      break
  for x in 0..len(sieve)-1:
    result.add((x*2)+3)




