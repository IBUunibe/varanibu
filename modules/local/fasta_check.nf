process FASTA_CHECK {
    input: 
    path fasta

    output:
    tuple val('genome'), path('genome_checked.fa')

    script:
    """
    cp $fasta genome_checked.fa
    """

}