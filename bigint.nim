import strutils

#this is very simple and dumb bigint library

type
  PBigInt* = ref TBigInt
  TBigInt* = object
    sign: bool
    digits: seq[int8]


converter toTBigInt*(x: int): TBigInt = 
  var x = x
  let sign = x < 0
  var digits = newseq[int8]()
  while x > 0:
    let d = x mod 10
    x = x /% 10
    digits.add(d)
  return TBigInt(sign: sign, digits: digits)

converter toBigInt*(x: string): TBigInt = 
  var sign = false
  var n = 0
  var digits = newseq[int8]()
  if x[0] == '-':
    n = 1
    sign = true
  for i in countdown(len(x)-1,n):
    digits.add(int8(parseInt($x[i])))
  return TBigInt(sign: sign, digits:digits)

proc compact(x: var TBigInt) = 
  while x.digits[len(x.digits)-1] == 0:
    discard pop(x.digits)

proc `[]` (x: TBigInt, i: int): int8 = 
  if i < len(x.digits):
    return x.digits[i]
  else:
    return 0

proc `$` (x: TBigInt): string =
  var x = x
  compact(x)
  var s = len(x.digits)
  if x.sign:
    s += 1

  var news = NewStringOfCap(s)
  if x.sign:
    news.add("+")
  for i in countdown(s-1,0):
    news.add($x[i])
  return news

proc abs(a: TBigInt): TBigInt =
  return TBigInt(sign: false, digits: a.digits)

proc `+` (a1: TBigInt, a2: TBigInt): TBigInt =
  #if a.sign == b.sign:
  #  var newd = newseq[int8]()
  #  return TBigInt(sign: a.sign, digits: newd)
  var carry = 0
  var newd = newseq[int8]()
  var a = abs(a1)
  var b = abs(a2)

  let maxl = max(len(a.digits),len(b.digits))-1
  for x in 0..maxl:
    let d = a[x]+b[x]+carry
    if d >= 10:
      newd.add(int8(d-10))
      carry = 1
    else:
      newd.add(int8(d))
      carry = 0
  if carry == 1:
    newd.add(int8(1))

  if a1.sign == true and a2.sign == true:
    return TBigInt(sign: true, digits: newd)
  if a1.sign == false and a2.sign == false:
    return TBigInt(sign: false, digits: newd)
  return TBigInt(sign: false, digits: newd) #FIXME! Mixed sign addition

#proc `*` (a: TBigInt, b: TBigInt): TBigInt = 


when isMainModule:
  var x: TBigInt = 500
  echo($x)
  x  = "234592385239058235235235"
  var x2: TBigInt = "900000000000100000000001" 
  echo(repr(x))
  echo($x)
  let x3 = x + x2
  echo(repr(x3))
  echo($x3)