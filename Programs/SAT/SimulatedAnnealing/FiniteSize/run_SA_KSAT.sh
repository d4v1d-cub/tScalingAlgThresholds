#!/bin/bash

NE=$1
K=$2
alpha=$3
nItE=$4
nsamp_each=$5
nsampl_total=$6


for seed in $(seq 1 $nsamp_each $nsampl_total)
do

    "SA_K-SAT_K_"$K".out" $alpha $NE $nItE $nsamp_each > "./Results/Out_SA_N_2to"$NE"_K_"$K"_alpha_"$alpha"_nIt_2to"$nItE"_nsamp_"$nsamp_each"_id_"$seed".txt" 2> "./Results/Error_SA_N_2to"$NE"_K_"$K"_alpha_"$alpha"_nIt_2to"$nItE"_nsamp_"$nsamp_each"_id_"$seed".txt"

done


exit 0

