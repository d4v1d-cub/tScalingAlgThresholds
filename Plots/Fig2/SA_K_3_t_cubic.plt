set term postscript enhanced color eps dl 2.5
filenameoutput="SA_K_3_N3_transition.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set log y
set ylabel "{/=28 U_{f}}" rotate by 90 offset 1,0
set xlabel "{/=28 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 4.22,1
set xra [3.95:4.25]
set yra [1e-2:1e2]
set tics  font ",24"
set format y "%g"

ac = 4.11
unset arrow
set arrow from 4.11,graph 0 to 4.11,graph 1 nohead lt -1
#set label "{/=28 {/Symbol a}_{SA}(N^3/2^{12})=4.11}" at 3.98, 50
set label "{/=28 t = N^3 / 2^{12}}" at 3.98, 50

set label "{/=32 K = 3}" at 4.01, 10

p "< awk '$1==1024 && $3==0.25*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=1024',\
"< awk '$1==2048 && $3==0.5*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=2048',\
"< awk '$1==4096 && $3==$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=4096',\
"< awk '$1==8192 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=8192',\
"< awk '$1==16384 && $3==4*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=16384',\
"< awk '$1==32768 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorl t '{/=26 N=32768'