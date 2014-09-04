reset
set terminal epslatex color
set output 'messung1.tex'
set xlabel 'Spannung [kV]'
set ylabel 'Plattenabstand [mm]'
set key top left
set xrange [0:6]

f1(x)=m*x+b
f2(x)=n*x+c

set fit logfile 'm3g.log'
fit f1(x) 'messung1.dat' u 1:2:(0.02) via m,b
set fit logfile 'm4g.log'
fit f2(x) 'messung1.dat' u 1:3:(0.02) via n,c


p 'messung1.dat' u 1:2:(0.02) w e t'Messwerte $m=3\,$g' ,\
f1(x) lt -1 t'Fit für $m=3\,$g',\
  'messung1.dat' u 1:3:(0.02) w e t'Messwerte $m=4\,$g' ,\
f2(x) lt 0 t'Fit für $m=4\,$g'


set output
!epstopdf messung1.eps
