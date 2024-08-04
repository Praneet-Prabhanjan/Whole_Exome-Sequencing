**NGS Whole_Exome_Sequecing  Pipeline**

As personalized medicine inches closer to reality, words or terms like genetics, genomics, DNA, and exome often appear frequently. The human genome comprises 3 billion “letters” (called base pairs). They are in turn wrapped into 23 pairs of thread-like structures called Chromosomes. Some sequence of letters (or DNA) forms a gene. Through experiments and studies, scientists have established that only 1 or 2 % of all genes provide instructions or code for proteins and that the coding portion of the genome is called EXOME.

Whole Exome Sequencing here is referred to as WES, a widely used method in NGS that involves sequencing the protein-coding regions of the genome. Our human genome roughly represents less than 2 % of the genome, however, 85% of the known disease-related contains VARIANTS, making this method entirely cost-effective and competitive to whole-genome sequencing. Sequencing and decoding the only coding regions of the entire genome will allow researchers to focus majorly on resources on the genes most likely to affect phenotype.

Here I describe one of the benchmarked WES pipelines, which starts and performs from a basic standard high-quality checking of raw data to complex findings and insights of the entire variants. I further describe entire open-source tools, techniques, algorithms, and software used during each step.

**Among the steps**
Quality check, Alignment, Recalibration, Variant calling, and Variant annotation.

**Softwares**
Fastp / FastQC, Bowtie, Samtools, Varscan, BCFtools, and VCFtools.

Refer: 
Meena, N., Mathur, P., Medicherla, K. M. and Suravajhala, P. (2018). A Bioinformatics Pipeline for Whole Exome Sequencing: Overview of the Processing and Steps from Raw Data to Downstream Analysis. Bio-101: e2805. DOI: 10.21769/BioProtoc.2805. https://www.biorxiv.org/content/10.1101/201145v1 
