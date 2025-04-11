#!/bin/bash

source activate sm_kmer

snakemake -n --rerun-incomplete

