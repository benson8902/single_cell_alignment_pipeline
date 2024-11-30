#!/bin/bash

while read -r line
do
    echo "Running Fastqc ${line}"
    fastqc -t 16 -o fastqc "${line}_1.fastq.gz" "${line}_2.fastq.gz" "${line}_3.fastq.gz"
    echo "Finish Fastqz ${line}"
done < SRR_Acc_List.txt
