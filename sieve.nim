import math

proc primes*(target: int): seq[int] =
  let sz = int(ceil(target/2))
  var sieve = newseq[bool](sz)
  for x in 0..sz-1:
    sieve[x] = false

  let maxv = target
  let stop = int(sqrt(float(target)))
  var n = 3
  var accum = newseq[int]()
  accum.add(2)
  while n < stop:
    let start = n*n
    for x in countup(start,target,n):
      sieve[(x-3) /% 2] = true 
    let p = sieve.find(false)
    if p == -1:
      break
    sieve[p] = true
    accum.add((p*2)+3)
    n = (p*2)+3
    if n >= stop:
      break
  for x in 0..len(sieve)-1:
    if sieve[x] == false and ((x*2)+3) < target:
      accum.add((x*2)+3)
  return accum
when isMainModule:
  echo(repr(primes(1000)))


