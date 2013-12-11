var fibs = @[1,1]
var n = 0
while n < 4000000:
  let x = fibs.len
  n = fibs[x-1]+fibs[x-2]
  fibs.add(n)

var sum = 0
for x in fibs:
  if x mod 2 == 0:
    sum += x
echo($sum)

