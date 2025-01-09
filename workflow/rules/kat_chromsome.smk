rule kat_chromsome:
    input:
        "results/zcat_ccs/ccs.fasta.gz"
    output:
        "results/kat_chromosome/kat-main.mx.spectra-cn.png",
    conda:
        "workflow/envs/kat.yaml"
    log:
        "logs/results/kat_chromomsome.log",
    threads: 16
    shell:
        """
        kat comp \
            -t 16 \
            -o results/kat_chromosome/kat \
            {input} \
            ../data_krill_chromosome_assemblies/krill.chromosome.fa.gz &> {log}
        """

