# quench_K-SAT.c

This program implements the zero-temperature Monte Carlo algorithm for solving the **K-SAT problem** on random graphs. This one is used to produce the Fig. 8 of the article ([arxiv](https://doi.org/10.48550/arXiv.2504.11174))


## Compilation

To compile the program, use the following command:

```bash
gcc -o quench_K-SAT.out quench_K-SAT.c -lm
```

Please pay attention to the fact that the number of variables per clause, `K`, is defined inside the code with the macro 

```c++
#define K [K]
```

so you change this in order to change `K`

## Usage

The user can run the command

```bash
./wfacwsat [N] [alpha] [maxiters] [nsamp_each]
```

where

- `N` is the number of variables.
- `alpha` is the number of clauses per variable (M / N).
- `maxiters` the maximum number of iterations.
- `nsamp_each` the number of histories to run.

We did not used all the parameters. In the script `run_quench_KSAT.sh`, located in the same folder `Programs/SAT/MCT0` shows how to run the code and what are the command line parameters that we used.