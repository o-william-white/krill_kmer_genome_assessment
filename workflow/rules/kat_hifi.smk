rule kat_hifi:
    input:
        ccs="results/jellyfish/ccs.jf",
        gen="results/jellyfish/krill.hifiasm-assembly.jf"
    output:
        "results/kat_hifi/kat-main.mx.spectra-cn.png",
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
            {input.ccs} \
            {input.gen} &> {log}
        """

