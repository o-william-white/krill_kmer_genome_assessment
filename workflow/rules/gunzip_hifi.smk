rule gunzip_hifi:
    input:
        "../data_krill_chromosome_assemblies/seqkit_sliding/krill.hifiasm-assembly_w2g_rename.fa.bgz"
    output:
        temp("results/gunzip_hifi/krill.hifiasm-assembly.fa")
    log:
        "logs/gunzip_hifi/gunzip_hifi.log",
    threads: 1
    shell:
        """
        gunzip -c {input} 1> {output} 2> {log}
        """

