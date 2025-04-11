rule jellyfish_count_hifi:
    input:
        "results/gunzip_hifi/krill.hifiasm-assembly.fa",
    output:
        "results/jellyfish/krill.hifiasm-assembly.jf",
    log:
        "logs/jellyfish/count_krill.hifiasm-assembly.log",
    params:
        kmer_length=27,
        size="100M",
    threads: 6
    wrapper:
        "v5.8.3/bio/jellyfish/count"
