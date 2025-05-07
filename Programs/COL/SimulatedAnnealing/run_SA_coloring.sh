#!/bin/bash


q=3
N=1000
cmin=11.1
dc=0.1
cmax=12
id0=1
ngr_total=10
A=100

nit=$((A * N))

trainpath="graphs_"$id0
mkdir $trainpath

for c in $(seq $cmin $dc $cmax)
do
  python gen_graphs_coloring.py 1 $ngr_total $c $N $trainpath
done



outfile="Out_SA_Q"$q"_A_"$A"_N_"$N"_M_"$M"_id0_$id.txt"
errfile="Error_SA_Q"$q"_A_"$A"_N_"$N"_M_"$M"_id0_$id.txt"

echo "# Q="$q"  N="$N"  M="$q" startTepm=1  nIter="$nit > $outfile

for graphname in `ls $trainpath`
do
  echo $graphname
  filename="${graphname%.*}"

  IFS='_' read -ra ADDR <<< $filename
  s_gr=${ADDR[-1]}
  
  "./SA_col_q_"$q".out" $N $c 1 $nit 1 1 $trainpath/$graphname $s_gr >> $outfile 2>> $errfile
  
done



exit 0

