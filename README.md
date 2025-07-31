### Some bash file need to make corrections every time!


**First of all:**

>    Need to check whether sratoolkit working.
> 
>    『export PATH=$PATH:$HOME/sratoolkit.3.0.1-ubuntu64/bin』

**Step 1 Download SRR file** 
>    If file size too big, you need to use "--max-size 100G"
>
>    If we want to speed up download file, we can 『sudo apt-get install parallel』
> 

    ex:
    1. prefetch -p --option-file SRR_Acc_List.txt
    or
    2. nohup prefetch -p --option-file SRR_Acc_List.txt > nohup.out 2>&1 &
    or
    3. cat SRR_Acc_List.txt | parallel -j 8 "prefetch -p {} > nohup.out 2>&1 &"
        if file size too big
            cat SRR_Acc_List.txt | parallel -j 8 "prefetch -p --max-size 100G {} > nohup.out 2>&1 &"
    (Speed up download )


**Step 2 SRA -> fastq**

  `Excute 『fastq_dump.sh』`
  
    ex:
    1. nohup fastq-dump --split-files --gzip SRR*******

**Step 3 fastqc : Quality Check**

  `Excute 『fastqc.sh』`

>  ★If there is SRR******_1.fastq.gz, SRR******_2.fastq.gz, SRR******_3.fastq.gz after fastq, you need to check which one is Read1, Read2 and Index1.
>
>  ★Even though only have SRR******_1.fastq.gz and SRR******_2.fastq.gz also need to check which one is Read1 and Read2.
> 
>  ★After check fastqc is correct, rename fastq file
>
>  ★FASTQ Detailed Description: https://help.basespace.illumina.com/files-used-by-basespace/fastq-files
>  
  `Excute 『rename_fastq.sh』`
  
      ex:
      1. fastqc -t 16 -o fastqc SRR******_1.fastq.gz
        -t => how many threads you want to use in CPU


**Step 4 Excute 10X Genomics Cell Ranger**

>  ★If there are multiple samples of a single individual then we excute cellranger aggr

    following:
    https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_ct


**Notice:**

    SRR_Acc_List.txt need to add new line, or the last file may not be excute.

    If you can't find python 
        first >> which python
    If still can't find python, then 
        export PATH=/home/benson0207/anaconda3/bin:/home/benson0207/anaconda3/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

    If you need to unzip file you may
        gunzip run_count_pbmc_SRR23942*/outs/filtered_feature_bc_matrix/*.gz
    
**Version**
>
>**Anaconda:** Python 3.9.7
>
>**numpy:** 1.22.3
>
>**scipy:** 1.9.1
>
>**pysam:** 0.17.0
>
>**h5py:** 3.6.0
>
>**pandas:** 1.3.5
>
>**STAR:** 2.7.2a
>
>**samtools:** samtools 1.12
