import bigint

var a: TBigInt = 1
var b: TBigInt = 1
var c: TBigInt = 0
var n = 2

while len(c.digits) < 1000:
  c = a + b
  a = b
  b = c
  n += 1
  echo($c)
echo($n)