rule kat_hifi:
    input:
        reads="results/jellyfish/reads.jf",
        genome="results/jellyfish/krill.hifiasm-assembly.jf"
    output:
        "results/kat_hifi/kat.dist_analysis.json",
        "results/kat_hifi/kat-main.mx",
        "results/kat_hifi/kat-main.mx.spectra-cn.png",
        "results/kat_hifi/kat.stats",
    conda:
        "../envs/kat.yaml"
    log:
        "logs/kat/kat_hifi.log",
    threads: 6
    shell:
        """
        kat comp \
            -t 6 \
            -o results/kat_hifi/kat \
            {input.reads} \
            {input.genome} &> {log}
        """
