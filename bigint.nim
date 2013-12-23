import strutils

#this is very simple and dumb bigint library

type
  PBigInt* = ref TBigInt
  TBigInt* = object
    sign: bool
    digits: seq[int8] = newseq[int]()

iterator kv[T](s: seq[T]): tuple[int,T] =
  var n = 0
  for x in s:
    yield (n, x)
    n += 1 

converter toTBigInt*(x: int): TBigInt = 
  let sign = x < 0
  var digits = newseq[int]()
  while x > 0:
    let d = x mod 10
    x = x /% 10
    digits.add(d)
  return TBigInt(sign: sign, digits: digits)

converter toBigInt*(x: string): TBigInt = 
  var sign = false
  var n = 0
  var digits = newseq[int]()
  if x[0] == "-":
    n = 1
    sign = true
  for i in coutndown(len(x) -1,i):
    digits.add(parseInt(x[i]))
  return TBigInt(sign: sign, digits:digits)


proc `$` (x: TBigInt): string =
  var s = newseq[string]()
  if x.sign:
    s &= "-"
  for a in x.digits:


  if x.sign:
    s &= "-"
  return join(reverse(s))
#proc `+` (a: TBigInt, b: TBigInt): TBigInt =
