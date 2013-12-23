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

proc compact(var x: TBigInt) = 
  while x.digits[len(x.digits)-1] == 0:
    discard pop(x)

proc `$` (x: TBigInt): string =
  var x = compact(x)
  var s = len(x.digits)
  if x.sign:
    s += 1

  var news = NewStringOfCap

proc abs(a: TBigInt): TBigInt =
  return TBigInt(sign: false, digits: a.digits)

proc `+` (a: TBigInt, b: TBigInt): TBigInt =
  if a.sign == b.sign:
    var newd = newseq[int8]()
    return TBigInt(sign: a.sign, digits: newd)
  


#proc `*` (a: TBigInt, b: TBigInt): TBigInt = 


when isMainModule:
  var x: TBigInt = 500
  echo($x)
  x = "234592385239058235235235"
  echo(repr(x))
  echo($x)