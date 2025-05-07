set term postscript enhanced color eps dl 2.5
filenameoutput="FMS_K_4_linear_tl_50000.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set ylabel "{/=26 P_{SAT}}" rotate by 90 offset 1,0
set xlabel "{/=26 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 9.58,0.5
set xrange [9.47:9.81]
set yrange [-0.05:1.05]
set tics  font ",24"
set format y "%g"

set label "{/=28 t = 50000 N}" at 9.52, 0.7


p "< awk '$1==8192 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_4.txt" u ($2/100):6:7 w errorl lw 2 lc 4 t '{/=26 N=8192',\
"< awk '$1==16384 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_4.txt" u ($2/100):6:7 w errorl lw 2 lc 5 t '{/=26 N=16384',\
"< awk '$1==32768 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_4.txt" u ($2/100):6:7 w errorl lw 2 lc 6 t '{/=26 N=32768',\
"< awk '$1==65536 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_4.txt" u ($2/100):6:7 w errorl lw 2 lc 7 t '{/=26 N=65536'