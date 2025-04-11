rule seqkit_stats:
    input:
        fastx="results/zcat_reads/reads.fastq",
    output:
        stats="results/seqkit_stats/reads.tsv",
    log:
        "logs/seqkit_stats/reads.log",
    params:
        command="stats",
        extra="--all --tabular",
    threads: 2
    wrapper:
        "v5.5.0/bio/seqkit"
