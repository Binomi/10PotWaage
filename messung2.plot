reset
set terminal epslatex color
set output 'messung2.tex'
set xlabel '$U^2$ [(kV)$^2$]'
set ylabel '$F$ [N]'
set key top left
set xrange [0:25]

f1(x)=m*x+b
f2(x)=n*x+c
f3(x)=p*x+d
f4(x)=q*x+e

set fit logfile 'd2mm.log'
fit f1(x) 'messung2.dat' u ($2*$2):($1*9.81/1000) via m,b
set fit logfile 'd2,5mm.log'
fit f2(x) 'messung2.dat' u ($3*$3):($1*9.81/1000) via n,c
set fit logfile 'd3mm.log'
fit f3(x) 'messung2.dat' u ($4*$4):($1*9.81/1000) via p,d
set fit logfile 'd4mm.log'
fit f4(x) 'messung2.dat' u ($5*$5):($1*9.81/1000) via q,e


p 'messung2.dat' u ($2*$2):($1*9.81/1000) t'Messwerte $d=2\,$mm' ,\
f1(x) lt -1 t'Fit für $d=2\,$mm',\
  'messung2.dat' u ($3*$3):($1*9.81/1000) t'Messwerte $d=2.5\,$mm' ,\
f2(x) lt -1 t'Fit für $d=2.5\,$mm',\
  'messung2.dat' u ($4*$4):($1*9.81/1000) t'Messwerte $d=3\,$mm' ,\
f3(x) lt -1 t'Fit für $d=3\,$mm',\
  'messung2.dat' u ($5*$5):($1*9.81/1000) t'Messwerte $d=4\,$mm' ,\
f4(x) lt -1 t'Fit für $d=4\,$mm'

set output
!epstopdf messung2.eps
