
for a in 1..998:
  for b in (a+1)..999:
    for c in (b+1)..1000:
      let s = (a*a) + (b*b)
      let q = (c*c)
      let p = (a+b+c)
      if s == q:
        #echo($a,"^2 + ",$b,"^2 = ",$c,"^2 = ",$q," abc = ",$p)
        if p == 1000:
          echo($a,"^2 + ",$b,"^2 = ",$c,"^2 = ",$q," abc = ",$p, " a*b*c = ",$(a*b*c))