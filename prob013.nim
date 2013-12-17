import strutils


var nums: seq[seq[int]] = newseq[seq[int]]()

var line: string = ""

var inf = open("grid.txt")

while inf.ReadLine(line):
