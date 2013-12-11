var sum = 0
for x in 3..999:
  if (x mod 3 == 0) or (x mod 5 == 0):
    sum += x
echo(sum)
