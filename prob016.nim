

var digits: array[0..500, int8]
var res: array[0..500, int8]
digits[500] = 2
var n = 999
while n > 0:
  #zero result array
  for x in 0..500:
    res[x] = 0
  var overflow = 0
  for x in countdown(500,0):
    let a = overflow + (digits[x] + digits[x])
    if a >= 10:
      res[x] = int8(a mod 10)
      overflow = 1
    else:
      res[x] = int8(a)
      overflow = 0
  digits = res


  n -= 1 

var sum = 0
for x in digits:
  sum += x
echo($sum)