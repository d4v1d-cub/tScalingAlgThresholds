N=$1
K=$2
alpha=$3
maxiters=$4
nsamp_each=$5
nsampl_total=$6



for seed in $(seq 1 $nsamp_each $nsampl_total)
do

    "quench_K-SAT_K_"$K".out" $N $alpha $maxiters $nsamp_each > "./Results/Out_Quenched_T0_N_"$N"_K_"$K"_alpha_"$alpha"_maxIt_"$maxiters"_nsamp_"$nsamp_each"_id_"$seed".txt" 2> "./Results/Error_Quenched_T0_N_"$N"_K_"$K"_alpha_"$alpha"_maxIt_"$maxiters"_nsamp_"$nsamp_each"_id_"$seed".txt"

done


exit 0

