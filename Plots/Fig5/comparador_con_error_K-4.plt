K=4

N=50000
s=250
alphaL3="9.0"
alphaH3="9.9"

datosL3='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaL3.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosH3='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaH3.'_semillas-'.s.'_N-'.N.'_t-1MC'

N=100000
#s=150
alphaL2="9.44"
alphaL1="9.56"
alphaL0="9.52"
alphaH0="9.6"
alphaH1="9.64"
alphaH2="9.68"

datosL2='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaL2.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosL1='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaL1.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosL0='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaL0.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosH0='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaH0.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosH1='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaH1.'_semillas-'.s.'_N-'.N.'_t-1MC'
datosH2='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alphaH2.'_semillas-'.s.'_N-'.N.'_t-1MC'
referencia='../../Results/SAT/SimulatedAnnealing/InfiniteSize/ajuste_K-'.K.''

set term postscript enhanced color eps dl 2.5
filenameoutput="Distribution_Ef-VS-n_transitionSA_K-".K.".eps"
set output filenameoutput

reset
set title "{/=26 K=4" offset -20,-25
#set size 1,1
set origin 0,0
set margin 11
#set ylabel "{/=26 {{/Symbol a}_u}^{final}(t)}" rotate by 90 offset 0,-1
set ylabel "{/=26 {{u}_{f}}" rotate by 90 offset -2,0
set xlabel "{/=26 {n}}" offset 0,0
set xrange [10:176776]
set yrange [0.02:1.0]
#set key spacing 2.0 maxrows 2 width 5 at 95, 0.85
set key spacing 2
set tics  font ",22"
#set label "{/=30 c = 5}" at 45, 0.95
#set ytics 0,.2,1
set logscale y
set logscale x

set format x "10^{%L}"
set format y "10^{%L}"


L3 = system(sprintf("sed -n '1p' %s | cut -f2", datosL3))
L2 = system(sprintf("sed -n '1p' %s | cut -f2", datosL2))
L1 = system(sprintf("sed -n '1p' %s | cut -f2", datosL1))
L0 = system(sprintf("sed -n '1p' %s | cut -f2", datosL0))
H0 = system(sprintf("sed -n '1p' %s | cut -f2", datosH0))
H1 = system(sprintf("sed -n '1p' %s | cut -f2", datosH1))
H2 = system(sprintf("sed -n '1p' %s | cut -f2", datosH2))
H3 = system(sprintf("sed -n '1p' %s | cut -f2", datosH3))

#p datosL3 u ($1):($2/L3):($4/L3)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH3 u ($1):($2/H3):($4/H3)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
, datosL2 u ($1):($2/L2):($4/L2)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH2 u ($1):($2/H2):($4/H2)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
,datosL1 u ($1):($2/L1):($4/L1)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH1 u ($1):($2/H1):($4/H1)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
,datosL0 u ($1):($2/L0):($4/L0)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH0 u ($1):($2/H0):($4/H0)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
, datosH3 u ($1):($3/H3)  		title "{/=26 {/Symbol a}=".alphaH3."0"	lc 7	dt 2 lw 4 w l \
, datosH2 u ($1):($3/H2)  		title "{/=26 {/Symbol a}=".alphaH2	lc 7	dt 3 lw 4 w l \
, datosH1 u ($1):($3/H1)  		title "{/=26 {/Symbol a}=".alphaH1	lc 7	dt 1 lw 4 w l \
, datosH0 u ($1):($3/H0)  		title "{/=26 {/Symbol a}=".alphaH0."0"	lc 7	dt 1 lw 8 w d \
,datosL0 u ($1):($3/L0)  		title "{/=26 {/Symbol a}=".alphaL0	lc 10	dt 1 lw 8 w d \
,datosL1 u ($1):($3/L1)  		title "{/=26 {/Symbol a}=".alphaL1	lc 10	dt 1 lw 4 w l \
,datosL2 u ($1):($3/L2)  		title "{/=26 {/Symbol a}=".alphaL2	lc 10	dt 3 lw 4 w l \
,datosL3 u ($1):($3/L3)  		title "{/=26 {/Symbol a}=".alphaL3."0"	lc 10	dt 2 lw 4 w l  


p datosL3 u ($1):($2/L3):($4/L3)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH3 u ($1):($2/H3):($4/H3)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
, datosL2 u ($1):($2/L2):($4/L2)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosL1 u ($1):($2/L1):($4/L1)  	notitle with filledcurves		lc 10 fs transparent solid 0.3 \
, datosH1 u ($1):($2/H1):($4/H1)  	notitle with filledcurves		lc 7 fs transparent solid 0.3 \
, datosH3 u ($1):($3/H3)  		title "{/=26 {/Symbol a}=".alphaH3."0"	lc 7	dt 3 lw 3 w l \
, datosH1 u ($1):($3/H1)  		title "{/=26 {/Symbol a}=".alphaH1	lc 7	dt 1 lw 2 w l \
,datosH0 u ($1):($2/H0):($4/H0)  	title "{/=26 {/Symbol a}=".alphaH0."0" with filledcurves		lc 0 fs transparent solid 0.3 \
, referencia u ($1):($2/H0)  		notitle 			lc 0	dt 3 lw 3 w l \
, datosL1 u ($1):($3/L1)  		title "{/=26 {/Symbol a}=".alphaL1	lc 10	dt 1 lw 2 w l \
, datosL2 u ($1):($3/L2)  		title "{/=26 {/Symbol a}=".alphaL2	lc 10	dt 3 lw 3 w l \
, datosL3 u ($1):($3/L3)  		title "{/=26 {/Symbol a}=".alphaL3."0"	lc 10	dt 1 lw 5 w d  

#, datosH0 u ($1):($3/H0)  		title "{/=26 {/Symbol a}=".alphaH0."0"	lc 0	dt 3 lw 3 w l \

