rule jellyfish_merge_ccs:
    input:
        expand(
            "results/jellyfish/{sample}.jf",
            sample=sample_data.index.tolist(),
        ),
    output:
        "results/jellyfish/merge.jf",
    log:
        "logs/jellyfish/merge.log",
    conda:
        "../envs/kat.yaml"
    threads: 1
    shell:
        """
        kat_jellyfish merge -o {output} {input} &> {log}
        """
