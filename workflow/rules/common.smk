import pandas as pd
import sys
from snakemake.utils import min_version


# define min version
min_version("8.4.12")


# set configfile
configfile: "config/config.yaml"


# read sample data
if os.path.exists(config["samples"]):
    sample_data = pd.read_csv(config["samples"], sep="\t").set_index("id", drop=False)
else:
    sys.exit(f"Error: samples file '{config['samples']}' does not exist")


# functions to get metadata sample list
def get_ftp_path(wildcards):
    return sample_data.loc[wildcards.sample, "ftp_path"]

def get_ccs(wildcards):
    return sample_data.loc[wildcards.sample, "ccs"]

def get_ccs_md5(wildcards):
    return sample_data.loc[wildcards.sample, "ccs_md5"]



