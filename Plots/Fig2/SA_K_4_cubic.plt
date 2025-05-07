set term postscript enhanced color eps dl 2.5
filenameoutput="SA_K_4_cubic.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set log y
set ylabel "{/=28 U_{f}}" rotate by 90 offset 1,0
set xlabel "{/=28 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 9.6,18
set xrange [9.1:9.62]
set yrange [1:1000]
set tics  font ",24"
set format y "%g"

set label "{/=28 t = N^{3} / 2^{16}}" at 9.15, 600

set label "{/=32 K = 4}" at 9.205, 175


p "< awk '$1==8192 && $3==1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=8192',\
"< awk '$1==16384 && $3==4*1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=16384',\
"< awk '$1==32768 && $3==4*4*1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=32768',\
"< awk '$1==65536 && $3==4*4*4*1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=65536',\
"< awk '$1==131072 && $3==4*4*4*4*1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=131072',\
"< awk '$1==262144 && $3==4*4*4*4*4*1024' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/SA_KSAT_all_K_4.txt" u 2:4:5 w errorl t '{/=26 N=262144'