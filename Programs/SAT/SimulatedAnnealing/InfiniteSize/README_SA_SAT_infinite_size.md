# SA_KSAT.jl

This julia script implements a Simulated Annealing (SA) algorithm for solving the **K-Satisfiability problem** on random graphs. The program is located in the `Programs/SAT/SimulatedAnnealing/InfiniteSize` directory. This one is used to produce the Figs. 5 and 6 of the article ([arxiv](https://doi.org/10.48550/arXiv.2504.11174))


## Usage

Run the script as follows:

```bash
julia --project=SimAnnProj SA_KSAT.jl [id0] [idf] [K] [N] [alpha]
```

where

- `id0`, `idf` initial and final identification numbers for the instances, respectively. The program will use all the identifications in the list ```bash [id0, ..., idf]``` to run Simulated Annealing for different instances
- `K` is the number of variables per clause
- `N` is the number of variables
- `alpha` is the number of clauses per variable (M / N).



The bash script `run_SA_KSAT_infinite_size.sh`, located in the same folder `Programs/SAT/SimulatedAnnealing/InfiniteSize` shows how to run the code and what are the command line parameters.

The file `graph.jl` was used to input a specific instance to the solver. It prints the instance to file that must then be read by the script `SA_KSAT.jl`. It can be used as follows:

```bash
julia --project=SimAnnProj graph.jl [id0] [idf] [K] [N] [alpha]
```

the parameters are the same explained above.


## Dependencies

We used the julia environment `SimAnnProj`. The configuration files `Manifest.toml` and `Project.toml` can be found in the folder with the same name.

