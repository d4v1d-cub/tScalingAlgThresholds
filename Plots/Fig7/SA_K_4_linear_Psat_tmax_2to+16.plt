set term postscript enhanced color eps dl 2.5
filenameoutput="SA_K_4_linear_Psat_tmax_2to+16.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set ylabel "{/=26 P_{SAT}}" rotate by 90 offset 1,0
set xlabel "{/=26 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 9.1,0.4
set xrange [8.98:9.35]
set yrange [-0.01:1.01]
set tics  font ",24"
set format y "%g"

set label "{/=28 t = 65536 N}" at 9.25, 0.9


p "< awk '$1==8192 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:6 w errorl t '{/=26 N=8192',\
"< awk '$1==16384 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:6 w errorl t '{/=26 N=16384',\
"< awk '$1==32768 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:6 w errorl t '{/=26 N=32768',\
"< awk '$1==65536 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:6 w errorl t '{/=26 N=65536',\
"< awk '$1==131072 && $3==65536' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:6 w errorl t '{/=26 N=131072'