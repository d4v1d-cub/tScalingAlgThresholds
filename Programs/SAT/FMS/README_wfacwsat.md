# wfacwsat.c

This program implements the Focused Metropolis Search (FMS) algorithm for solving the **K-SAT problem** on random graphs [[1]](#1). This is an implementation by Sakari Seitz, made as a modification of the public walksat package, by Henry Kautz. This one is used to produce the Fig. 9 of the article ([arxiv](https://doi.org/10.48550/arXiv.2504.11174))


## Compilation

To compile the program, use the following command:

```bash
gcc -o wfacwsat wfacwsat.c -lm
```

## Usage

The code allows for several command line parameters, and the user can run the command

```bash
./wfacwsat 
```

to find their usage.

We did not used all the parameters. In the script `run_FMS_KSAT.sh`, located in the same folder `Programs/SAT/FMS` shows how to run the code and what are the command line parameters that we used.

The file `Graph_to_CNF_input.cpp` was used to input a specific instance to the solver as follows:

```bash
./Graph_to_CNF_input.out [N] [M] [K] [idumgraph] </dev/null 2>/dev/null | ./wfacwsat -FMS -tries [] -seed [] -cutoff [] -noise [A] [B]
```

where

- `N` is the number of variables
- `M` is the number of clauses
- `K` is the number of variables per clause
- `idumgraph` is the seed for the random number generator used to create the instance

## References
<a id="1">[1]</a> 
Sakari Seitz, Mikko Alava and Pekka Orponen. 
Focused local search for random 3-satisfiability. 
J. Stat. Mech. Teory Exp., P06006 (2005).