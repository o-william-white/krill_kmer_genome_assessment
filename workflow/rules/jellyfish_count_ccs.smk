rule jellyfish_count_ccs:
    input:
        "results/ascp/{sample}.fastq",
    output:
        temp("results/jellyfish/{sample}.jf"),
    log:
        "logs/jellyfish/{sample}.log",
    conda:
        "../envs/kat.yaml"
    threads: 6
    shell:
        """
        kat_jellyfish count -m 27 -s 100M --disk -t 6 -C -o {output} {input} &> {log}
        """
