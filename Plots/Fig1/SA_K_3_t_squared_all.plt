set term postscript enhanced color eps dl 2.5
filenameoutput="SA_K_3_N2_transition_all.eps"
set output filenameoutput

reset
set multi
set size 1,1
set origin 0,0
set log y
set ylabel "{/=26 U_{f}}" rotate by 90 offset 1,0
set xlabel "{/=26 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 4.22,1
set xra [3.85:4.25]
set yra [1e-2:1e2]
set tics  font ",24"
set format y "%g"


ac = 4.031250
set arrow from ac,graph 0 to ac,graph 1 nohead lw 0.7 dt 1


ac1 = 4.045
set arrow from ac1,graph 0 to ac1,graph 1 nohead lw 0.7 dt 2

p "< awk '$1==1024 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 1 dt 2 notitle,\
"< awk '$1==1024 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 1 pt 2 ps 1 t '{/=26 N=1024',\
"< awk '$1==2048 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 2 dt 2 notitle,\
"< awk '$1==2048 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 2 pt 4 ps 1 t '{/=26 N=2048',\
"< awk '$1==4096 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 4 dt 2 notitle,\
"< awk '$1==4096 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 4 pt 6 ps 1 t '{/=26 N=4096',\
"< awk '$1==8192 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 6 dt 2 notitle,\
"< awk '$1==8192 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 6 pt 8 ps 1 t '{/=26 N=8192',\
"< awk '$1==16384 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 7 dt 2 notitle,\
"< awk '$1==16384 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 7 pt 10 ps 1 t '{/=26 N=16384',\
"< awk '$1==32768 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 3 dt 2 notitle,\
"< awk '$1==32768 && $3==8*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 3 pt 12 ps 1 t '{/=26 N=32768',\
"< awk '$1==1024 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 1 dt 1 notitle,\
"< awk '$1==1024 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 1 pt 2 ps 1 notitle,\
"< awk '$1==2048 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 2 dt 1 notitle,\
"< awk '$1==2048 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 2 pt 4 ps 1 notitle,\
"< awk '$1==4096 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 4 dt 1 notitle,\
"< awk '$1==4096 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 4 pt 6 ps 1 notitle,\
"< awk '$1==8192 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 6 dt 1 notitle,\
"< awk '$1==8192 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 6 pt 8 ps 1 notitle,\
"< awk '$1==16384 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 7 dt 1 notitle,\
"< awk '$1==16384 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 7 pt 10 ps 1 notitle,\
"< awk '$1==32768 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w l lc 3 dt 1 notitle,\
"< awk '$1==32768 && $3==2*$1' ../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/medieK3.dat" u 2:4:5 w errorbars lc 3 pt 12 ps 1 notitle


set key spacing 2.5 maxrows 7 width 6 at 4.02,80
p (100000,100000) w l lc 8 dt 1 title '{/=26 t=2 N^{2}',\
(100000,100000) w l lc 8 dt 2   title '{/=26 t=8 N^{2}'
