# SA_clusters_mod.c

This program implements a Simulated Annealing (SA) algorithm for solving the **q-coloring problem** on graphs. The q-coloring problem involves assigning one of `Q` colors to each vertex of a graph such that no two adjacent vertices share the same color. The program is located in the `Programs/COL/SimulatedAnnealing` directory. This one is used to produce the Fig. 4 of the article ([arxiv](https://doi.org/10.48550/arXiv.2504.11174))


## Compilation

To compile the program, use the following command:

```bash
gcc -o SA_clusters_mod.out SA_clusters_mod.c -lm
```

The `-lm` flag links the math library, which is required for functions like `sqrt` and `pow`.

Please pay attention to the fact that the number of colors `Q` is defined inside the code with the macro 

```c++
#define Q [Q]
```

so you change this in order to change `Q`

## Usage

Run the compiled program as follows:

```bash
./SA_clusters_mod.out [N] [c] [T0] [nIter] [R] [gamma] [graphname] [graph_id]
```

where

- `N` is the number of nodes in the graph
- `c` is the graph's connectivity
- `T_0` is the initial temperature for the annealing
- `nIter` is the maximum number of iterations
- `R` is the number of replicas (set to one in our simulations)
- `gamma`is the damping coefficient (set to one in out simulations, i.e., no damping)
- `graphname` is the name of the file with the graph
- `graph_id` is a number that identifies the graph in the dataset, to print as output.



The bash script `run_SA_coloring.sh`, located in the same folder `Programs/COL/SimulatedAnnealing` shows how to run the code and what are the command line parameters.

## Dependencies

The program uses standard C libraries:
- `<stdio.h>`: For input/output operations.
- `<stdlib.h>`: For memory allocation and general utilities.
- `<math.h>`: For mathematical functions.
- `<time.h>`: For seeding the random number generator.

## Notes

- The program is designed for research purposes and may require modifications for specific use cases.
- The number of colors Q is defined as a macro in the source code.

