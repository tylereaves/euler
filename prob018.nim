import strutils


var triangle: seq[seq[int]] = newseq[seq[int]]()

var line: string = ""
var vals: seq[int] = @[]
var inf = open("018.txt")

while inf.ReadLine(line):

  vals = @[]

  for n in split(line):
    vals.add(ParseInt(n))
  triangle.add(vals)

for x in countdown(triangle.len() - 2,0):
  let next = triangle[x+1]
  for y in 0..len(triangle[x])-1:
    let v = triangle[x][y]
    triangle[x][y] = max(v+next[y], v+next[y+1])

echo($triangle[0][0])

