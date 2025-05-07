set term postscript enhanced color eps dl 2.5
filenameoutput="SA_K_3_Psol_N1_transition.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set ylabel "{/=26 P_{SAT}}" rotate by 90 offset 1,0
set xlabel "{/=26 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 3.985,0.4
set xrange [3.85:4.27]
set yrange [-0.01:1.01]
set tics  font ",24"
set format y "%g"

set label "{/=28 t = 65536 N}" at 4.16, 0.9


p "< awk '$1==8192 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:6 w errorl t '{/=26 N=8192',\
"< awk '$1==16384 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:6 w errorl t '{/=26 N=16384',\
"< awk '$1==32768 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:6 w errorl t '{/=26 N=32768'