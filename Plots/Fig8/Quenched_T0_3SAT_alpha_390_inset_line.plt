set term postscript enhanced color eps dl 2.5
filenameoutput="Quenched_T0_3SAT_alpha_390_inset_line.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set multi
set log x
set ylabel "{/=26 F({/Symbol t}_s)}" rotate by 90 offset 0,-1
set xlabel "{/=26 {/Symbol t}_s}" offset 0,0
set key spacing 2.0 maxrows 10 width 4 at 10000,0.75
set xrange [3000:120000]
set yrange [-0.01:1.01]
set tics  font ",24"
set label "{/=30 {/Symbol a} = 3.9}" at 8000, 0.9

p '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_102400_K_3_alpha_3.9_maxIt_2000000.txt' u 1:($0/10000) w p ps 1.2 pt 6 lc 1 lw 2  title "{/=28 N=102400" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_204800_K_3_alpha_3.9_maxIt_2000000.txt' u 1:($0/9940) w p ps 1.2 pt 6 lc 2 lw 2  title "{/=28 N=204800" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_409600_K_3_alpha_3.9_maxIt_2000000.txt' u 1:($0/5743) w p ps 1.2 pt 6 lc 4 lw 2  title "{/=28 N=409600" \
, '../../Results/SAT/MCT0/AllData/Quenched_T0_KSAT_N_819200_K_3_alpha_3.9_maxIt_2000000.txt' u 1:($0/587) w p ps 1.2 pt 6 lc 6 lw 2  title "{/=28 N=819200"


reset
set size 0.4,0.45
set origin 0.52, 0.14
set label '{/=24 ((log N)^{/Symbol d} / {~{{/Symbol t}}{0.8 \_}}_s)^{1/{/Symbol e}}}' at 3,2.5
set xlabel "{/=24 {/Symbol a}}" offset 0,0
set xrange [3.1:4.04]
set yrange [0:2.2]
set tics  font ",22"
set ytics (0, 1, 2, 3)
set xtics (3.2, 3.5, 3.8, 4.04)

a=2.5
b=-0.345

e=-1.0/b

title2=sprintf("{/=20 {/Symbol d}=%.1f  {/Symbol e}=%.1f}", a, e)

set label title2 at 3.15, 0.3


f(x) = c * x + d
fit f(x) '../../Results/SAT/MCT0/AllData/AllMeansToPlot_K_3_maxIt_2000000.txt' u 1:((exp($3)/log($2)**a)**b) via c,d

p '../../Results/SAT/MCT0/AllData/AllMeansToPlot_K_3_maxIt_2000000.txt' u 1:((exp($3)/log($2)**a)**b):($4*(-b)*((exp($3)/log($2)**a)**b)) w error pt 6 lc 6 lw 3 notitle \
, f(x) w l lc 6 lw 2 notitle