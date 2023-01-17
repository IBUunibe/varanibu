#!/usr/bin/env nextflow 

nextflow.enable.dsl=2

process runFastp{

    tag "${fastQbasename}|${sampleID}|${libraryID}"
      scratch '/scratch'

      input:
        tuple val(meta), path(reads)
      output:
        tuple val(fastQbasename), val(sampleID), val(libraryID), val(rgID), val(platform), val(center), val(run_date),file(left),file(right),emit: outputTrimAndSplit 
        tuple val(fastQbasename), val(sampleID), val(libraryID), file(json),file(html), emit: report
      script:
        left = file(fastqR1).getBaseName() + ".cleaned.fastq.gz"
        right = file(fastqR2).getBaseName() + ".cleaned.fastq.gz"
        json = fastQbasename + "_" + sampleID + "_" + libraryID + ".fastp.json"
        html = fastQbasename + "_" + sampleID + "_" + libraryID + ".fastp.html"
    """
        fastp --in1 $fastqR1 --in2 $fastqR2 --out1 $left --out2 $right -w $task.cpus  -j $json -h $html
    """
}

