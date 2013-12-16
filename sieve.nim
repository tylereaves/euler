import math

proc primes*(target: int): seq[int] =
  let sz = int(ceil(target/2))
  var sieve = newseq[bool](sz)
  let stop = int(sqrt(float(target)))
  var n = 3
  var accum = newseq[int]()
  accum.add(2)
  sieve[0] = true
  accum.add(3)
  while n < stop:

    let start = n*n
    for x in countup(start,target,n):
      if x mod 2 != 0:
        sieve[(x-3) /% 2] = true 

    let p = sieve.find(false)
 
    if p == -1:
      break
    if n >= stop:
      break
    
    sieve[p] = true
    accum.add((p*2)+3)
    n = (p*2)+3
    
  for x in 0..len(sieve)-1:
   
    if sieve[x] == false and ((x*2)+3) < target:
      accum.add((x*2)+3)
  return accum
when isMainModule:
  echo(repr(primes(1000000)))


