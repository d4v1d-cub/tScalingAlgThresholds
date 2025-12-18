set term postscript enhanced color eps dl 2.5
set encoding iso_8859_1
filenameoutput="SA_K_3_fits_squared_a_2to-5_inset_bands_nmin_32768_nmax_524288_for_paper.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set multi
set ylabel "{/=28 {/Symbol a}}" rotate by 90 offset -0.5,2
set xlabel "{/=28 N^{-{/Symbol w}*}}" offset -2,-0.5
set key spacing 2.0 maxrows 10 width 6 at 0.002,4.02
set xrange [0:0.005]
set yrange [3.71:4.05]
set tics  font ",24"
set format y "%g"


#set label "{/=22 {/Symbol a}_{SA} = 9.6670 \261 0.0017}" at 0.0015, 9.35

gmean=0.7926

p '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:3:4 notitle w filledcurves fc 'gray' fs solid 0.8 \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:3 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:4 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:2 notitle lc 8 lw 2 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/crossings_K_3_squared_a_2to-5.txt' u ($1<=524288?$1 ** -gmean:1/0):3:4 title "{/=28 t = N^{2} / 2^{5}}" ps 1.2 pt 2 lc 8 w errorbars \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/crossings_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u ($1<=524288?$1 ** -gmean:1/0):3:4 notitle ps 1.2 pt 2 lw 2 lc 7 w errorbars

reset

set size 0.45,0.48
set origin 0.46,0.5
set ylabel "{/=22 {/Symbol a}}" rotate by 90 offset -0.5,-0.5
set xlabel "{/=22 N^{-{/Symbol w}*}}" offset -2,-0.5
set key spacing 2.0 maxrows 10 width 6 at 0.0023,4.01
set xrange [0:0.0004]
set yrange [3.95:4.05]
set tics  font ",20"
set format y "%g"
set xtics 0, 0.0002, 0.0004
set ytics 3.95, 0.02, 4.05


p '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:3:4 notitle w filledcurves fc 'gray' fs solid 0.8 \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:3 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:4 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u 1:2 notitle lc 8 lw 2 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/crossings_K_3_squared_a_2to-5.txt' u ($1<=524288?$1 ** -gmean:1/0):3:4 notitle ps 1.2 pt 2 lc 8 w errorbars \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/crossings_K_3_squared_a_2to-5_nmin_32768_nmax_524288.txt' u ($1<=524288?$1 ** -gmean:1/0):3:4 notitle ps 1.2 pt 2 lw 2 lc 7 w errorbars