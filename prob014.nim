import tables

var memo = initTable[int,int]()
memo[1] = 1

proc even(n: int): bool {. inline .} =
  if n mod 2 == 0:
    return true
  return false  

proc collatz(n: int): int  = 
  if memo.hasKey(n):
    return memo[n]
  var result = 0
  if n.even():
    result = collatz(int(n/2))  + 1
  else:
    result = collatz((n*3)+1) + 1
  memo[n] = result
  return result

var max = 0
var maxv = 0

for x in 1..100000000:
  var r = collatz(x)
  if x mod 1000000 == 0:
    echo($x)
  if r > max:
    max = r
    maxv = x
    echo("New max: ",$maxv," - ",$max)
    echo(gc_getstatistics())



