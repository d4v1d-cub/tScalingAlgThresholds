set term postscript enhanced color eps dl 2.5
set encoding iso_8859_1
filenameoutput="SA_K_3_fits_squared_a_2to-5_chi_sqr_vs_N_nmax_524288.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set multi
set log
set lmargin 10
set bmargin 4
set ylabel "{/=28 {/Symbol c}^{2}}" rotate by 90 offset 1,2
set xlabel "{/=28 t(N_{min})}" offset -2,0
set key spacing 2.0 maxrows 10 width 6 at 5000,60
set xrange [25:5000]
set yrange [0.000000001:100]
set tics  font ",24"
set ytics ( "1e-8" 1e-8, "1e-6" 1e-6, "1e-4" 1e-4, "0.01" 0.01, "1" 1, "100" 100)
set arrow nohead from 25, 1 to 5000, 1 dt 2 lw 3 lc 7


p '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/best_chi_K_3_squared_a_2to-5_nmax_524288.txt' u 2:3 title "{/=28 t = N^{2} / 2^{5}}" ps 1.2 pt 6 lc 8 w lp \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/best_chi_K_3_squared_a_2to-5_nmax_524288.txt' u ($2==1024?$2:1/0):3 notitle ps 1.5 pt 5 lc 7 lw 3 w lp


 
reset

set size 0.5,0.5
set origin 0.15,0.15
set log x
set ylabel "{/=22 error({/Symbol a}_{SA}) X 10^{4}}" rotate by 90 offset -0.5,-0.5
set xlabel "{/=22 t(N_{min})}" offset 0,1
set key spacing 2.0 maxrows 10 width 6 at 0.0023,4.01
set xrange [25:5500]
set yrange [3:6]
set tics  font ",20"
set format y "%g"
set ytics 3,1,6


p '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/best_chi_K_3_squared_a_2to-5_nmax_524288.txt' u 2:($5*10000) notitle ps 1.2 pt 2 lc 8 w lp \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/best_chi_K_3_squared_a_2to-5_nmax_524288.txt' u ($2==1024?$2:1/0):($5*10000) notitle ps 1.5 pt 5 lc 7 lw 3 w lp