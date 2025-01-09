# Set up conda env
```
# setup conda env
conda env create -n sm_hifi_kmer -f workflow/envs/conda_env.yaml
conda config --set channel_priority flexible
```

Note that the jellyfish wrapper uses conda defaults so causes an error on crop diversity cluster. 

