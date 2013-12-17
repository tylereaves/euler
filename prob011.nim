import strutils


var grid: seq[seq[int]] = newseq[seq[int]]()

var line: string = ""
var vals: seq[int] = @[]
var inf = open("grid.txt")

while inf.ReadLine(line):

  vals = @[]

  for n in split(line):
    vals.add(ParseInt(n))
  grid.add(vals)

var m = 0

proc check(x,y: int): int = 
  let h = grid[x][y] * grid[x+1][y] * grid[x+2][y] * grid[x+3][y] 
  let v = grid[x][y] * grid[x+1][y] * grid[x][y+2] * grid[x][y+3] 
  let d1 = grid[x][y] * grid[x+1][y+1] * grid[x+2][y+2] * grid[x+3][y+3] 
  let d2 = grid[x][y+3] * grid[x+1][y+2] * grid[x+2][y+1] * grid[x+3][y] 
  return max(h,v,d1, d2)


for x in 0..16:
  for y in 0..16:
    let v = check(x,y)
    if v > m:
      m = v

echo($m)

