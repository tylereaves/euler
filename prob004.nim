var largest = 0

proc palindrome(s: string): bool = 
  for x in 0..(s.len() div 2):
    if s[x] != s[s.len()-(x+1)]:
      return false
  return true

for a in 100..999:
  for b in a..999:
    let v = a*b
    let s = $(v)
    if palindrome(s) and v > largest:
      echo("New largest: ",$a," x ",$b," = ",$v)
      largest = v