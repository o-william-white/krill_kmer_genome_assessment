rule seqkit_stats:
    input:
        fastx="results/ascp/{sample}.fastq.gz",
    output:
        stats="results/seqkit_stats/{sample}.tsv",
    log:
        "logs/seqkit_stats/{sample}.log",
    params:
        command="stats",
        extra="--all --tabular",
    threads: 2
    wrapper:
        "v5.5.0/bio/seqkit"
