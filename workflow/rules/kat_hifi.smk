rule kat_hifi:
    input:
        "results/zcat_ccs/ccs.fasta.gz"
    output:
        "results/kat_hifi/kat-main.mx.spectra-cn.png",
    conda:
        "workflow/envs/kat.yaml"
    log:
        "logs/results/kat_hifi.log",
    threads: 16
    shell:
        """
        kat comp \
            -t 16 \
            -o results/kat_hifi/kat \
            {input} \
            ../data_krill_chromosome_assemblies/krill.hifiasm-assembly.fa.gz &> {log}
        """

