var x = 0
var z = 0
for a in 0..200:
  for b in 0..(200-a):
    for c in 0..(200-(a+(2*b))):
      for d in 0..(200-(a+(2*b)+(5*c))):
        for e in 0..(200-(a+(2*b)+(5*c)+(10*d))):
          for f in 0..(200-(a+(2*b)+(5*c)+(10*d)+(20*e))):
            for g in 0..(200-(a+(2*b)+(5*c)+(10*d)+(20*e)+(50*f))):
              for h in 0..(200-(a+(2*b)+(5*c)+(10*d)+(20*e)+(50*f)+(100*g))):
                z += 1
                if a+(2*b)+(5*c)+(10*d)+(20*e)+(50*f)+(100*g)+(200*h) == 200:
                  x += 1
                  echo(a," x p ",b," x 2p ",c," x 5p ",d," x 10p ",e, " x 20p ", f, " x 50p ",g, " x 100p ", h, " x 200p")
echo($x)
echo($z)