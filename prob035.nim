import sieve, strutils

let ps = primes(1000000)

proc rotate(n: int): seq[int] = 
  var rots = newseq[int]()
  var s = $n
  var ns = s
  for z in 0..s.len()-1:
    
    for x in 0..len(s)-1:
      echo("S: ",s," NS: ",ns," X: ",$x,"  I: ",$((x+1) mod s.len()))
      ns[x] = s[(x+1) mod s.len()]
    rots.add(parseint(ns))
    s = ns
  return rots


echo(repr(rotate(179)))