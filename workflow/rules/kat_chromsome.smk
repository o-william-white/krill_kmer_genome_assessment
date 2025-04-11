rule kat_chromosome:
    input:
        reads="results/jellyfish/reads.jf",
        genome="results/jellyfish/krill.chromosome.jf"
    output:
        "results/kat_chromosome/kat.dist_analysis.json",
        "results/kat_chromosome/kat-main.mx",
        "results/kat_chromosome/kat-main.mx.spectra-cn.png",
        "results/kat_chromosome/kat.stats"
    conda:
        "../envs/kat.yaml"
    log:
        "logs/kat/kat_chromosome.log",
    threads: 6
    shell:
        """
        kat comp \
            -t 6 \
            -o results/kat_chromosome/kat \
            {input.reads} \
            {input.genome} &> {log}
        """
