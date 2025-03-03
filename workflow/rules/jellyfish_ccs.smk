rule jellyfish_count_ccs:
    input:
        "results/zcat_ccs/ccs.fastq",
    output:
        "results/jellyfish/ccs.jf",
    log:
        "logs/jellyfish/ccs.log",
    conda:
        "../envs/kat.yaml"
    threads: 6
    shell:
        """
        kat_jellyfish count -m 27 -s 100M --disk -t 6 -C -o {output} {input} &> {log}
        """
