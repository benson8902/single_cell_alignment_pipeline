#!/bin/bash

while read -r SRR; do

    echo "Running fastq for ${SRR}"

    nohup fastq-dump --split-files --gzip "${SRR}"

    echo "Finish fastq for ${SRR}"

done < SRR_Acc_List.txt
