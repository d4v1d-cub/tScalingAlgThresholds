# Graph Generation Script

This script, `gen_graphs_coloring.py`, is designed to generate random graphs using the Erdős–Rényi model and save them in a specific format. It is located in the `Programs/COL` folder.

## Features

- Generates random graphs using the Erdős–Rényi model (`nx.gnm_random_graph`).
- Saves the generated graphs in a custom text format.
- Allows customization of graph parameters such as the number of nodes, edges, and random seed.

## Requirements

The script requires the following Python libraries:
- `networkx`
- `numpy`

You can install the required libraries using pip:
```bash
pip install networkx numpy
```

## Usage

Run the script from the command line with the following arguments:

```bash
python gen_graphs_coloring.py <seed> <num_graphs> <connectivity> <num_nodes> <output_path>
```

### Arguments:
1. `<seed>`: Random seed

 for

 reproducibility (integer).
2. `<num_graphs>`: Number of graphs to generate (integer).
3. `<connectivity>`: connectivity of the graph (float).
4. `<num_nodes>`: Number of nodes in each graph (integer).
5. `<output_path>`: Path to the folder where the graphs will be saved.

### Example:
```bash
python gen_graphs_coloring.py 42 10 12.5 100 ./graphs
```

This will:
- Use a random seed of `42`.
- Generate `10` graphs.
- Set the graph connectivity to `12.5`.
- Create graphs with `100` nodes each.
- Save the graphs in the `./graphs` directory.

## Output Format

Each generated graph is saved as a text file in the specified output directory. The file format is as follows:
- The first line contains the number of nodes: `N <number_of_nodes>`.
- The second line contains the number of edges: `M <number_of_edges>`.
- Subsequent lines list the edges in the format: `e <node1> <node2>`.

### Example Output:
```
N   100
M   250
e   1   2
e   3   4
...
```

## Notes

- The script automatically creates the output directory if it does not exist.
- Node indices in the output file are 1-based.

## License

This script is provided as-is. Modify and use it as needed for your projects.