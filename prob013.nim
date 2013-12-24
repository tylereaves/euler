import strutils
import bigint

var nums: seq[seq[int]] = newseq[seq[int]]()

var line: string = ""

var inf = open("013.txt")
var sum: TBigInt = 0
while inf.ReadLine(line):
  let x: TBigInt = line
  sum = sum + x

echo($sum)
