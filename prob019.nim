
var day = 0 #Jan 1 1900
var days = 0
var count = 0
for year in 1900..2000:
  for month in 1..12:
    case month 
    of 4,6,9, 11:
      days = 30
    of 2:
      if year mod 4 == 0 and (year mod 400 == 0 or year mod 100 != 0):
        days = 29
      else:
        days = 28
    else:
      days = 31
    for d in 1..days:
      if d == 1 and day mod 7 == 6 and year > 1900:
        count += 1
      day += 1
echo($count)