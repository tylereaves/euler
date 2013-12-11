
var primes = @[2,3,5,7,11,13]

var test = 15

while len(primes) < 10001:
  var prime = true
  for m in primes:
    if test mod m == 0:
      prime = false
      break
  if prime:
    primes.add(test)
  test += 2

echo($primes[10000])