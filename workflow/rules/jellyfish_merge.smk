rule jellyfish_merge:
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
        "../envs/jellyfish.yaml"
    threads: 1
    shell:
        """
        jellyfish merge -o {output} {input} &> {log}
        """
