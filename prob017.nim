
proc numberToString*(n: int): string =
  if n == 0:
    return "zero"
  if n < 20:
    case n:
    of 1:
      return "one"
    of 2:
      return "two"
    of 3:
      return "three"
    of 4:
      return "four"
    of 5:
      return "five"
    of 6:
      return "six"
    of 7:
      return "seven"
    of 8:
      return "eight"
    of 9:
      return "nine"
    of 10:
      return "ten"
    of 11:
      return "eleven"
    of 12:
      return "twelve"
    of 13:
      return "thirteen"
    of 14:
      return "fourteen"
    of 15:
      return "fifteen"
    of 16:
      return "sixteen"
    of 17:
      return "seventeen"
    of 18:
      return "eighteen"
    of 19:
      return "nineteen"
    else:
      return ""
  if n < 100:
    let digit = n mod 10
    let leader = n /% 10
    var s = ""
    case leader:
      of 2:
        s = "twenty"
      of 3:
        s = "thirty"
      of 4:
        s = "forty"
      of 5:
        s = "fifty"
      of 6:
        s = "sixty"
      of 7:
        s = "seventy"
      of 8:
        s = "eighty"
      of 9:
        s = "ninety"
      else:
        return ""
    if digit == 0:
      return s
    else:
      return s & " " & numberToString(digit)
  if n < 1000:
    let leader = numberToString(n /% 100) & " hundred"
    let rem = n mod 100
    if rem == 0:
      return leader
    else:
      return leader & " and " & numberToString(rem)
  let higher = [(1000,"thousand"),(1000000,"million"),(1000000000,"billion")]
  for x in higher:
    let f = n /% x[0]
    if f > 0 and f < 1000:
      let rem = n mod x[0]
      if rem == 0:
        return numberToString(f) & " " & x[1]
      else:
     
        return numberToString(f) & " " & x[1] & " " & numberToString(rem)
        
when ismainModule:
  echo(numberToString(738))
  echo(numberToString(3738))
  echo(numberToString(1000))
  echo(numberToString(738234395))
