set term postscript enhanced color eps dl 2.5
set encoding iso_8859_1
filenameoutput="SA_K_4_fits_quartic_inset_bands.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set multi
set ylabel "{/=28 {/Symbol a}}" rotate by 90 offset 0.5,1
set xlabel "{/=28 N^{-{/Symbol w}*}}" offset -2,-0.5
set key spacing 2.0 maxrows 10 width 6 at 0.0007,9.48
set xrange [0:0.002]
set yrange [9.35:9.7]
set tics  font ",24"
set format y "%g"
set ytics 9.4, 0.1, 9.7


#set label "{/=22 {/Symbol a}_{SA} = 9.6542 \261 0.0018}" at 0.0011, 9.47

gmean=0.7373

p '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_quartic.txt' u 1:3:4 notitle w filledcurves fc 'gray' fs solid 0.8 \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_quartic.txt' u 1:3 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_quartic.txt' u 1:4 notitle lc 8 lw 1 dt 3 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/data_to_plot_fits_quartic.txt' u 1:2 notitle lc 8 lw 2 w l \
, '../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/crossings_K_4_quartic.txt' u ($1 ** -gmean):3:4 title "{/=28 t = N^{4} / 2^{29}}" ps 1.2 pt 2 lc 8 w errorbars

reset

set size 0.42,0.42
set origin 0.52,0.55
set ylabel "{/=22 {/Symbol c}^{2}}" rotate by 90 offset 0.5,0
set xlabel "{/=22 {/Symbol w}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 9.85,12
set xrange [0.67:0.82]
set yrange [0:3]
set tics  font ",20"
set format y "%g"
set ytics 0,1,3
set xtics 0.68, 0.04, 0.8

set label "{/=19 {/Symbol w}*}" at 0.7373, 0.25

#set arrow nohead from 0.6936, 1.0028041466185704 to 0.7817, 1.0037424798541073 lc 8 dt 3

p "../../Results/SAT/SimulatedAnnealing/FiniteSize/ProcessedData/fits_K_4_quartic.txt" u 1:2 lw 2 lc 7 w l