# Subsidy Treaty Code


The `experiments_*.ipy` scripts launch a wave of slurm jobs simulating the model via `Simulate.ipy` under various conditions, saving the respective checkpoints into a `results_*/` folder. These checkpoints take up a lot of space and are not committed to the repo.

The `Simulate.ipy` code relies on various statistical estimates performed, and datasets assembled within `Data.ipynb` and saved into the `data/` directory.

The `Evaluate.ipynb` loops through the checkpoints in the `results_*/` folder and assembles the relevant statistics into DataFrames, which are saved into `results.pkl` or `results.csv` files. These summarized results are committed. The notebook also visulatizes these DataFrames and saves the figures into the `figures/` folder.

