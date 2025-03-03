rule kat_chromosome:
    input:
        ccs="results/jellyfish/ccs.jf",
        gen="results/jellyfish/krill.chromosome.jf"
    output:
        "results/kat_chromosome/kat-main.mx.spectra-cn.png",
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
            {input.ccs} \
            {input.gen} &> {log}
        """

