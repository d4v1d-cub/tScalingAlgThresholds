# Algorithmic thresholds in combinatorial optimization depend on the time scaling

## Introduction

This repository contains all the code used to generate data for the article "Algorithmic thresholds in combinatorial optimization depend on the time scaling" ([arxiv](https://doi.org/10.48550/arXiv.2504.11174)). The user can find programs to:
* Run the Simulated Annealing algorithm for K-SAT and q-coloring problems.
* Run the Focused Metropolis Search (FMS) algorithm on K-SAT instances.
* Run the zero-temperature Monte Carlo on K-SAT instances.

It also contains all the data and scripts necessary to reproduce all the figures in the paper.

## List of the different programs

- SA_clusters_mod.c (Simulated Annealing for q-coloring) [Location: `Programs/COL/SimulatedAnnealing`]
- SA_K-SAT.c (Simulated Annealing for K-SAT) [Location: `Programs/SAT/SimulatedAnnealing/FiniteSize`]
- SA_KSAT.jl (Simulated Annealing for K-SAT) [Location: `Programs/SAT/SimulatedAnnealing/InfiniteSize`]
- wfacwsat.c (Focused Metropolis Search for K-SAT) [Location: `Programs/SAT/FMS`]
- quench_K-SAT.c (zero-temperature Monte Carlo for K-SAT) [Location: `Programs/SAT/MCT0`]


The user can find README.md files for each ones of these programs.

## Data

The folder `Results/` contains all of the data necessary to reobtain the figures in our paper ([arxiv](https://doi.org/10.48550/arXiv.2504.11174)).

Its structure of the whole repository is:

```
├── Plots
│   ├── Fig1
│   ├── Fig10
│   ├── Fig2
│   ├── Fig3
│   ├── Fig4
│   ├── Fig5
│   ├── Fig6
│   ├── Fig7
│   ├── Fig8
│   └── Fig9
├── Programs
│   ├── COL
│   │   └── SimulatedAnnealing
│   └── SAT
│       ├── FMS
│       ├── MCT0
│       └── SimulatedAnnealing
│           ├── FiniteSize
│           └── InfiniteSize
│               └── SimAnnProj
└── Results
    ├── COL
    │   └── SimulatedAnnealing
    │       ├── AllData
    │       └── ProcessedData
    └── SAT
        ├── FMS
        │   ├── AllData
        │   └── ProcessedData
        ├── MCT0
        │   └── AllData
        └── SimulatedAnnealing
            ├── FiniteSize
            │   ├── AllData
            │   │   ├── K_3
            │   │   └── K_4
            │   └── ProcessedData
            └── InfiniteSize
                ├── Average
                │   ├── K_3
                │   ├── K_4
                │   └── K_5
                └── MINIMAX
                    ├── K_3
                    ├── K_4
                    └── K_5
```

The folders called `AllData` contain raw data, while `ProcessedData` contain the files that are direcly used to produce the figures. Names are informative of the contents.


## Plots

The folder `/Plots` contains all the plots and the corresponding gnuplot scripts. Each one is prepared to be run as it is, reading the data in the folder `Results/` and producing the figure.

## References
<a id="1">[1]</a> 
Sakari Seitz, Mikko Alava and Pekka Orponen. 
Focused local search for random 3-satisfiability. 
J. Stat. Mech. Teory Exp., P06006 (2005).
