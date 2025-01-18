# Subsidy Treaties - Global Abatement If Cooperation Is Fragile

This repo contains the code to reproduce the results in the [Subsidy Treaties](https://github.com/jonas-metzger/subsidy-treaties/tree/main/paper/Subsidy_Treaties-Jonas_Metzger.pdf?raw=true) paper.

This repo contains 
- extensive datawrangling and statistical analysis in [`code/Data.ipynb`](https://github.com/Jonas-Metzger/subsidy-treaties/blob/main/code/Data.ipynb), combining various sources of publicly available data in `code/data/`, comprised of:
  - a) climate data used to obtain country-specific estimates of marginal damages from warming
  - b) data on electricity generation
  - c) other economic indicators necessary to calibrate our strutcutal model
- cuda-accelerated pytorch code in [`code/Simulate.ipy`](https://github.com/Jonas-Metzger/subsidy-treaties/blob/main/code/Simulate.ipy) which numerically solves our model for the economies of US, China, EU and India over the next century under various counterfactuals, in an efficient tensorized fashion
- different `code/experiments*.ipy` scripts launching `code/Simulate.ipy` in various ways 
- a notebook [`code/Evaluate.ipynb`](https://github.com/Jonas-Metzger/subsidy-treaties/blob/main/code/Evaluate.ipynb) which assembles the results of the experiments into the `code/figures` we report in the paper.
