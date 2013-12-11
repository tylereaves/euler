

proc gcd(a,b: int):int =
  var x = b
  var y = a
  var t = 0
  while x != 0:
    t = x
    x = y mod x
    y = t
  echo ("GCD of ",$a, " and ",$b, " is ",$y)
  return y

proc lcm(a,b: int): int =
  return (a * b) /% gcd(a,b)

var g = lcm(1,2)
for x in 3..20:
  g = lcm(g,x)

echo($g)