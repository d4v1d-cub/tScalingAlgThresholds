#!/bin/bash

N=$1
K=$2
ainit=$3
alphastep=$4
aend=$5
idumstep=$6
nidum=$7


mkdir D
mkdir D/G
mkdir D/B
mkdir D/D
mkdir Salidas


s0=$8
sf=$9


for alpha in $(seq $ainit $alphastep $aend)
do
for i in $(seq $s0 $idumstep $sf)
do

    julia --project=SimAnnProj graph.jl $i $((i+idumstep-1)) $K $N $alpha > "./Salidas/salidaGrapho_dificil_K_"$K"_N_"$N"_alpha_"$alpha"_idum_"$i".txt" 2> "./Salidas/ErrorGrapho_dificil_K_"$K"_N_"$N"_alpha_"$alpha"_idum_"$i".txt"
    julia --project=SimAnnProj SA_KSAT.jl $i $((i+idumstep-1)) $K $N $alpha > "./Salidas/salida_dificil_K_"$K"_N_"$N"_alpha_"$alpha"_idum_"$i".txt" 2> "./Salidas/Error_dificil_K_"$K"_N_"$N"_alpha_"$alpha"_idum_"$i".txt"

done
done

exit 0

