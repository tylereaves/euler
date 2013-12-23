import math

var n = 1
var x = 2

proc factors(n: int): int = 
  var c = 0
  let stop = int(sqrt(float(n)))
  for z in 1..stop:
    if n mod z == 0:
      c += 2
  return c


while true:
  let c = factors(n)
  if c >= 500:
    echo(n)
    break
  #echo(n," ",c," ",x)

  n = n + x
  x += 1
