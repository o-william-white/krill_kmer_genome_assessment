#!/bin/bash

source activate sm_kmer

snakemake --dag | dot -Tsvg > dag.svg
snakemake --rulegraph | dot -Tsvg > rulegraph.svg

