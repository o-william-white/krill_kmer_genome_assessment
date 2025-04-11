rule jellyfish_count_reads:
    input:
        "results/zcat_reads/reads.fastq",
    output:
        "results/jellyfish/reads.jf",
    log:
        "logs/jellyfish/count_reads.log",
    params:
        kmer_length=27,
        size="100M",
        extra="--canonical",
    threads: 6
    wrapper:
        "v5.8.3/bio/jellyfish/count"
