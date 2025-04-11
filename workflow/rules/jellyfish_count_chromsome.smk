rule jellyfish_count_chromosome:
    input:
        "results/gunzip_chromosome/krill.chromosome.fa",
    output:
        "results/jellyfish/krill.chromosome.jf",
    log:
        "logs/jellyfish/count_krill.chromosome.log",
    params:
        kmer_length=27,
        size="100M",
    threads: 6
    wrapper:
        "v5.8.3/bio/jellyfish/count"

