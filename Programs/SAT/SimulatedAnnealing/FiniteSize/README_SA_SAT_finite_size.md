# SA_K-SAT.c

This program implements a Simulated Annealing (SA) algorithm for solving the **K-Satisfiability problem** on random graphs. The program is located in the `Programs/SAT/SimulatedAnnealing/FiniteSize` directory. This one is used to produce the Figs. 1, 2, 3 and 7 of the article ([arxiv](https://doi.org/10.48550/arXiv.2504.11174))


## Compilation

To compile the program, use the following command:

```bash
gcc -o SA_K-SAT.out SA_K-SAT.c -lm
```

The `-lm` flag links the math library, which is required for functions like `sqrt` and `pow`.

Please pay attention to the fact that the number of variables per clause, `K`, is defined inside the code with the macro 

```c++
#define K [K]
```

so you change this in order to change `K`

## Usage

Run the compiled program as follows:

```bash
SA_K-SAT.out [alpha] [NE] [nItE] [nsamp_each]
```

where

- `alpha` is the number of clauses per variable (M / N).
- pow(2, `NE`) is the number of variables
- pow(2, `nItE`) is the maximum number of iterations
- `nsamp_each` the number of histories to run.



The bash script `run_SA_KSAT.sh`, located in the same folder `Programs/SAT/SimulatedAnnealing/FiniteSize` shows how to run the code and what are the command line parameters.


## Notes

- The program is designed for research purposes and may require modifications for specific use cases.
- The number of colors `K` is defined as a macro in the source code.

