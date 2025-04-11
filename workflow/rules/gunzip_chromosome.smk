rule gunzip_chromosome:
    input:
        "../data_krill_chromosome_assemblies/seqkit_sliding/krill.chromosome_w2g_rename.fa.bgz"
    output:
        temp("results/gunzip_chromosome/krill.chromosome.fa")
    log:
        "logs/gunzip_chromosome/gunzip_chromosome.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

