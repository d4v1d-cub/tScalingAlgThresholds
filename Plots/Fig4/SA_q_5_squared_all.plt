set term postscript enhanced color eps dl 2.5
filenameoutput="SA_q_5_squared_all.eps"
set output filenameoutput

reset
set multi
set size 1,1
set origin 0,0
set log y
set ylabel "{/=28 U_{f}}" rotate by 90 offset 1,0
set xlabel "{/=28 c}" offset 0,0
set key spacing 2.0 maxrows 10 width 6 at 13.05,0.6
set xrange [11:13.1]
set yrange [0.01:60]
set tics  font ",24"
set format y "%g"


p "< awk '$1==2048 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 5 dt 2 notitle,\
"< awk '$1==2048 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 5 pt 14 ps 1 t '{/=26 N=2048',\
"< awk '$1==4096 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 3 dt 2 notitle,\
"< awk '$1==4096 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 3 pt 16 ps 1 t '{/=26 N=4096',\
"< awk '$1==8192 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 1 dt 2 notitle,\
"< awk '$1==8192 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 1 pt 2 ps 1 t '{/=26 N=8192',\
"< awk '$1==16384 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 2 dt 2 notitle,\
"< awk '$1==16384 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 2 pt 4 ps 1 t '{/=26 N=16384',\
"< awk '$1==32768 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 4 dt 2 notitle,\
"< awk '$1==32768 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 4 pt 6 ps 1 t '{/=26 N=32768',\
"< awk '$1==65536 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 6 dt 2 notitle,\
"< awk '$1==65536 && $3==100*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 6 pt 8 ps 1 t '{/=26 N=65536',\
"< awk '$1==2048 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 5 dt 3 notitle,\
"< awk '$1==2048 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 5 pt 14 ps 1 notitle,\
"< awk '$1==4096 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 3 dt 3 notitle,\
"< awk '$1==4096 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 3 pt 16 ps 1 notitle,\
"< awk '$1==8192 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 1 dt 3 notitle,\
"< awk '$1==8192 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 1 pt 2 ps 1 notitle,\
"< awk '$1==16384 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 2 dt 3 notitle,\
"< awk '$1==16384 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 2 pt 4 ps 1 notitle,\
"< awk '$1==32768 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 4 dt 3 notitle,\
"< awk '$1==32768 && $3==1000*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 4 pt 6 ps 1 notitle,\
"< awk '$1==4096 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 3 dt 1 notitle,\
"< awk '$1==4096 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 3 pt 16 ps 1 notitle,\
"< awk '$1==8192 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 1 dt 1 notitle,\
"< awk '$1==8192 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 1 pt 2 ps 1 notitle,\
"< awk '$1==16384 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 2 dt 1 notitle,\
"< awk '$1==16384 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 2 pt 4 ps 1 notitle,\
"< awk '$1==32768 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 4 dt 1 notitle,\
"< awk '$1==32768 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 4 pt 6 ps 1 notitle,\
"< awk '$1==65536 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 6 dt 1 notitle,\
"< awk '$1==65536 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 6 pt 8 ps 1 notitle,\
"< awk '$1==131072 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w l lc 7 dt 1 notitle,\
"< awk '$1==131072 && $3==10*$1' ../../Results/COL/SimulatedAnnealing/ProcessedData/SA_col_all_q_5.txt" u 2:4:5 w errorbars lc 7 pt 10 ps 1 t '{/=26 N=131072'


set key spacing 2.5 maxrows 7 width 6 at 11.7,20
p (100000,100000) w l lc 8 dt 1 title '{/=26 t=10 N^{2}',\
(100000,100000) w l lc 8 dt 2   title '{/=26 t=100 N^{2}',\
(100000,100000) w l lc 8 dt 3   title '{/=26 t=1000 N^{2}'