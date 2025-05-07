set term postscript enhanced color eps dl 2.5
filenameoutput="Quenched_T0_4SAT_alpha_860_inset_line.eps"
set output filenameoutput

reset
set multi
set size 1,1
set origin 0,0
set log x
set ylabel "{/=26 F({/Symbol t}_s)}" rotate by 90 offset 0,-1
set xlabel "{/=26 {/Symbol t}_s}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 24000,0.5
set xrange [3200:25000]
set yrange [-0.01:1.01]
set tics  font ",24"
set label "{/=30 {/Symbol a} = 8.6}" at 13500, 0.8

p '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_102400_K_4_alpha_8.6_maxIt_2000000.txt' u 1:($0/2929) w p ps 1.2 pt 6 lc 1 lw 2  title "{/=28 N=102400" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_204800_K_4_alpha_8.6_maxIt_2000000.txt' u 1:($0/1348) w p ps 1.2 pt 6 lc 2 lw 2  title "{/=28 N=204600" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_409600_K_4_alpha_8.6_maxIt_2000000.txt' u 1:($0/1614) w p ps 1.2 pt 6 lc 4 lw 2  title "{/=28 N=409600" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_819200_K_4_alpha_8.6_maxIt_2000000.txt' u 1:($0/498) w p ps 1.2 pt 6 lc 6 lw 2  title "{/=28 N=819200"


reset
set size 0.4,0.45
set origin 0.1, 0.4
set label '{/=24 ((log N)^{{/Symbol d}} / {~{{/Symbol t}}{0.8 \_}}_s)^{1/{/Symbol e}}}' at 8.3,0.31
set xlabel "{/=24 {/Symbol a}}" offset 0,0
set xrange [8.35:8.834]
set yrange [0:]
set tics  font ",22"
set ytics (0, 0.1, 0.2, 0.3)
set xtics (8.4, 8.6, 8.83)

a=1.5
b=-0.37
e=-1.0/b

title2=sprintf("{/=20 {/Symbol d}=%.1f  {/Symbol e}=%.1f}", a, e)
set label title2 at 8.37, 0.04

g(x) = e * x + f
fit g(x) '../../Results/SAT/MCT0/AllData/AllMeansToPlot_K_4_part.txt' u 1:((exp($3)/log($2)**a)**b) via e,f


p '../../Results/SAT/MCT0/AllData/AllMeansToPlot_K_4_part.txt' u 1:((exp($3)/log($2)**a)**b):($4*(-b)*((exp($3)/log($2)**a)**b)) w error pt 6 lc 6 lw 3 notitle \
, g(x) w l lc 6 lw 2 dt 2 notitle