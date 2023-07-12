set terminal eps
set output "output.eps"

set pm3d
set hidden3d
set datafile separator " "
set xlabel "x"
set ylabel "y"
set zlabel "solution"
set view 30, 30, 1, 1
splot "solution.gpl" using 1:2:3:3 with lines lc palette

