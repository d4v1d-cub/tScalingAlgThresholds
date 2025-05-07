#! /bin/bash

N=$1
alpha=$2
K=$3
nsamples=$4
hist=$5
seed_fms=$6
tl=$7
eta=$8
path=$9
sgr_0=${10}
ngr_in=${11}

M=$((alpha * N / 100))

for idumgraph in $(seq $sgr_0 $((sgr_0+ngr_in-1)))
do

	./Graph_to_CNF_input.out $N $M $K $idumgraph </dev/null 2>/dev/null | ./wfacwsat -FMS -tries $hist -seed $seed_fms -cutoff $((N * tl)) -noise $eta 1000 > $path"out_FMS_K_"$K"_N_"$N"_eta_"$eta"_alpha_"$alpha"_idumgraph_"$idumgraph"_tl_"$tl".txt" 2>/dev/null
		echo "sent  N="$N"  M="$M"  eta="$eta" idumgraph="$idumgraph
		mv $path"out_FMS_K_"$K"_N_"$N"_eta_"$eta"_alpha_"$alpha"_idumgraph_"$idumgraph"_tl_"$tl".txt" $project/Results
		echo $done_str >> $donefile
done

