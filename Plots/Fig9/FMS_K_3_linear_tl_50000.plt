set term postscript enhanced color eps dl 2.5
filenameoutput="FMS_K_3_linear_tl_50000.eps"
set output filenameoutput

reset
set size 1,1
set origin 0,0
set ylabel "{/=26 P_{SAT}}" rotate by 90 offset 1,0
set xlabel "{/=26 {/Symbol a}}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 4.15,0.5
set xrange [4.096:4.262]
set yrange [-0.05:1.05]
set tics  font ",24"
set format y "%g"

set label "{/=28 t = 50000 N}" at 4.14, 0.7


p "< awk '$1==1024 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=1024',\
"< awk '$1==2048 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=2048',\
"< awk '$1==4096 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=4096',\
"< awk '$1==8192 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=8192',\
"< awk '$1==16384 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=16384',\
"< awk '$1==32768 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=32768',\
"< awk '$1==65536 && $3==50000' ../../Results/SAT/FMS/ProcessedData/FMS_KSAT_all_K_3.txt" u ($2/100):6:7 w errorl lw 2 t '{/=26 N=65536'