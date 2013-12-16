import sieve, strutils, tables

const target = 1000000

let ps = primes(target)


proc rotate(n: int): seq[int] = 
  var rots = newseq[int]()
  var s = $n
  var ns = s
  for z in 0..s.len()-1:
    
    for x in 0..len(s)-1:
      #echo("S: ",s," NS: ",ns," X: ",$x,"  I: ",$((x+1) mod s.len()))
      ns[x] = s[(x+1) mod s.len()]
    rots.add(parseint(ns))
    s = ns
 
  return rots


var seen = newseq[int]()
var c = 0
for x in countup(1,target):
  if c mod 10000 == 0:
    echo($c)
  c += 1
  if ps.contains(x):
    let xs = rotate(x)
    var ok = true
    for z in xs:
      if not ps.contains(z):
        ok = false
    if ok:
      seen.add(x)

echo(repr(seen))
echo(seen.len())