#!/bin/bash

# setup conda env
conda env create -n sm_kmer -f workflow/envs/conda_env.yaml
conda config --set channel_priority flexible 

