K=5
N0=1000
N1=3125
N2=12500
N3=100000

s=250
s1=150
s2=700

alpha1="19.69"
alpha2="19.36"

set term postscript enhanced color eps dl 2.5
filenameoutput="Errroe_Distribution_Ef-VS-n_transitionSA_K-".K.".eps"
set output filenameoutput

reset
set title "{/=26 K=5" offset -20,-25
#set size 1,1
set origin 0,0
set margin 11
#set ylabel "{/=26 {{/Symbol a}_u}^{final}(t)}" rotate by 90 offset 0,-1
set ylabel "{/=26 {{u}_f}}" rotate by 90 offset -0,0
set xlabel "{/=26 {n}}" offset 0,0
set xrange [70:176776]
set yrange [0.0023/0.07:0.030/0.07]
#set key spacing 2.0 maxrows 2 width 5 at 95, 0.85
set key spacing 2
set tics  font ",22"
#set label "{/=30 c = 5}" at 45, 0.95
#set ytics 0,.2,1
set logscale y
set logscale x

set format x "10^{%L}"

set format y "10^{%L}"

#set ytics add (\
#    "10^{-0.7}" 10**(-0.7), \
#"10^{-1.3}" 10**(-1.3) \
#)

datosH0='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha1.'_K-'.K.'_semillas-'.s2.'_N-'.N0.'_t-1MC_MOD'
datosL0='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha2.'_K-'.K.'_semillas-'.s2.'_N-'.N0.'_t-1MC_MOD'

datosH1='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha1.'_K-'.K.'_semillas-'.s2.'_N-'.N1.'_t-1MC'
datosL1='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha2.'_K-'.K.'_semillas-'.s2.'_N-'.N1.'_t-1MC'

datosH2='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha1.'_K-'.K.'_semillas-'.s2.'_N-'.N2.'_t-1MC'
datosL2='../../Results/SAT/SimulatedAnnealing/InfiniteSize/Average/K_'.K.'/Average_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha2.'_K-'.K.'_semillas-'.s2.'_N-'.N2.'_t-1MC'


alpha1="19.68"
alpha2="19.36"
datosH3='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha1.'_semillas-'.s.'_N-'.N3.'_t-1MC'
datosL3='../../Results/SAT/SimulatedAnnealing/InfiniteSize/MINIMAX/K_'.K.'/MINIMAX_n-VS-Ef_ZonaSat-Unsat_MC_alpha-'.alpha2.'_semillas-'.s.'_N-'.N3.'_t-1MC'

referencia='ajuste_K-'.K.''

H0 = system(sprintf("sed -n '1p' %s | cut -f2", datosH0))
L0 = system(sprintf("sed -n '1p' %s | cut -f2", datosL0))
H1 = system(sprintf("sed -n '1p' %s | cut -f2", datosH1))
L1 = system(sprintf("sed -n '1p' %s | cut -f2", datosL1))
H2 = system(sprintf("sed -n '1p' %s | cut -f2", datosH2))
L2 = system(sprintf("sed -n '1p' %s | cut -f2", datosL2))
H3 = system(sprintf("sed -n '1p' %s | cut -f2", datosH3))
L3 = system(sprintf("sed -n '1p' %s | cut -f2", datosL3))

#p datosH3 u ($1):($2/H3):($4/H3)  		title "{/=26 {N}=".N3 		 w filledcurves	lc 7 fs transparent solid 0.4\
, datosL3 u ($1):($2/L3):($4/L3) 	 	notitle with filledcurves			lc 10 fs transparent solid 0.4 \
, datosH2 u ($1):($2/H2)  			title "{/=26 {N}=".N2."\t"			lc 7	dt 1 lw 6 w l \
, datosL2 u ($1):($2/L2)  			notitle						lc 10	dt 1 lw 6 w l \
, datosH1 u ($1):($2/H1)  			title "{/=26 {N}=".N1."\t\t"			lc 7	dt 1 lw 4 w l \
, datosL1 u ($1):($2/L1)  			notitle						lc 10	dt 1 lw 4 w l \
, datosH0 u ($1):($2/H0)  			title "{/=26 {N}=".N0."\t\t"			lc 7	dt 1 lw 2 w l \
, datosL0 u ($1):($2/L0)  			notitle						lc 10	dt 1 lw 2 w l 

#p datosH3 u ($1):($2/H3):($2/H3)  		title "{/=26 {N}=".N3	 		w filledcurves	lc 0 fs transparent solid 0.4\
, datosH2 u ($1):($2/H2)  			title "{/=26 {N}=".N2."\t "			lc 0	dt 1 lw 6 w l \
, datosH1 u ($1):($2/H1)  			title "{/=26 {N}=".N1."\t  \t"			lc 0	dt 1 lw 4 w l \
, datosH0 u ($1):($2/H0)  			title "{/=26 {N}=".N0."\t  \t"			lc 0	dt 1 lw 2 w l \
, datosH3 u ($1):($2/H3):($4/H3)  		title "{/=26 {/Symbol a}=19.68"	 		w filledcurves	lc 7 fs transparent solid 0.4\
, datosL3 u ($1):($2/L3):($4/L3) 	 	title "{/=26 {/Symbol a}=19.36"	 		w filledcurves	lc 10 fs transparent solid 0.4 \
, datosH2 u ($1):($2/H2)  			notitle						lc 7	dt 1 lw 6 w l \
, datosL2 u ($1):($2/L2)  			notitle						lc 10	dt 1 lw 6 w l \
, datosH1 u ($1):($2/H1)  			notitle						lc 7	dt 1 lw 4 w l \
, datosL1 u ($1):($2/L1)  			notitle						lc 10	dt 1 lw 4 w l \
, datosH0 u ($1):($2/H0)  			notitle						lc 7	dt 1 lw 2 w l \
, datosL0 u ($1):($2/L0)  			notitle						lc 10	dt 1 lw 2 w l 

set style line 1 lt 0 pt 7 ps 1

p datosH3 u ($1):($2/H3):($2/H3)  		title "{/=26 {N}=".N3	 		w filledcurves	lc 0 fs transparent solid 0.4\
, datosH2 u ($1):($2/H2)  			title "{/=26 {N}=".N2."\t "			lc 0 	dt 1 lw 3 w l \
, datosH2 u ($1):($2/H2)  			title "{/=26 {N}=".N1."\t  \t"			lc 0 	dt 3 lw 3 w l \
, datosH2 u ($1):($2/H2)  			title "{/=26 {N}=".N0."\t  \t"			lc 0	dt 1 lw 5 w d \
, datosH3 u ($1):($2/H3):($4/H3)  		title "{/=26 {/Symbol a}=19.68"	 		w filledcurves	lc 7 fs transparent solid 0.4\
, datosL3 u ($1):($2/L3):($4/L3) 	 	title "{/=26 {/Symbol a}=19.36"	 		w filledcurves	lc 10 fs transparent solid 0.4 \
, datosH2 u ($1):($2/H2)  			notitle						lc 7	dt 1 lw 3 w l \
, datosL2 u ($1):($2/L2)  			notitle						lc 10	dt 1 lw 3 w l \
, datosH1 u ($1):($2/H1)  			notitle						lc 7	dt 3 lw 3 w l \
, datosL1 u ($1):($2/L1)  			notitle						lc 10	dt 3 lw 3 w l \
, datosH0 u ($1):($2/H0)  			notitle						lc 7	dt 1 lw 5 w d \
, datosL0 u ($1):($2/L0)  			notitle						lc 10	dt 1 lw 5 w d 

#p datosL3 u ($1):($2/L3):($4/L3) 	 	title "{/=26 {N}=".N3 with filledcurves			lc 6 fs transparent solid 0.4 \
, datosL2 u ($1):($2/L2)  			title "{/=26 {N}=".N2."\t"				lc 7	dt 1 lw 4 w l \
, datosL1 u ($1):($2/L1)  			title "{/=26 {N}=".N1."\t \t"				lc 10	dt 1 lw 4 w l \
, datosL0 u ($1):($2/L0)  			title "{/=26 {N}=".N0."\t \t"				lc 1	dt 1 lw 4 w l 


#\
, datosH3 u ($1):($3/H3)  			title "{/=26 {/Symbol a}=".N3		lc 6	dt 1 lw 4 w l \
, datosL3 u ($1):($3/L3)  			notitle					lc 6	dt 1 lw 4 w l 


