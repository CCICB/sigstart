
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sigstart

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/sigstart)](https://CRAN.R-project.org/package=sigstart)
[![Codecov test
coverage](https://codecov.io/gh/CCICB/sigstart/graph/badge.svg)](https://app.codecov.io/gh/CCICB/sigstart)
<!-- badges: end -->

**Sigstart** reads small variants, copy number changes, and structural
rearrangements from common bioinformatics file formats like VCFs and
segment files. It converts these data into formats compatible with
**sigminer** and other signature analysis tools.

## Installation

You can install the development version of sigstart from
[GitHub](https://github.com/) with:

``` r
if (!require("remotes"))
    install.packages("remotes")

remotes::install_github("selkamand/sigstart")
```

## Quick Start

``` r
library(sigstart)

# Convert SNVs and Indels from a tumor-normal VCF -> MAF-like dataframe for sigminer
path_vcf_snv <- system.file("tumor_normal.purple.somatic.vcf.gz",package = "sigstart")
sigminer_maf_like_dataframe <- parse_vcf_to_sigminer_maf(path_vcf_snv, sample_id = "tumor")

# Convert SNVs and INDELs from sample-chrom-pos-ref-alt TSV file to a MAF-like dataframe (Pos should be 1-based)
path_tsv <- system.file("snvs_indels.tsv", package = "sigstart")
sigminer_maf_like_dataframe <- parse_tsv_to_sigminer_maf(path_tsv, verbose = FALSE)

# Convert SNVs and INDELs from a single-sample chrom-pos-ref-alt TSV file to a MAF-like dataframe (Pos should be 1-based)
path_tsv <- system.file("snvs_indels.singlesample.tsv", package = "sigstart")
sigminer_maf_like_dataframe <- parse_tsv_to_sigminer_maf(path_tsv, verbose = FALSE, sample_id = "tumor")

# Convert Purple SVs from VCF -> BEDPE-like structure for sigminer
path_vcf_sv <- system.file("tumor.purple.sv.vcf", package = "sigstart")
sigminer_sv_dataframe <-  parse_purple_sv_vcf_to_sigminer(path_vcf_sv, sample_id = "tumor")

# Convert Purple SVs from VCF -> BEDPE structure for sigprofiler
bedpe_dataframe <- parse_purple_sv_vcf_to_sigprofiler(path_vcf_sv)

# Convert Purple SVs from VCF -> BEDPE structure (identical output to above)
bedpe_dataframe <- parse_purple_sv_vcf_to_bedpe(path_vcf_sv)

# Convert Purple CN Segment File -> Sigminer 
path_cn <- system.file("purple.cnv.somatic.tsv", package = "sigstart")
sigminer_cn_dataframe <- parse_purple_cnv_to_sigminer(path_cn, sample_id = "tumor")

# Convert CN Segment files from other tools -> Sigminer
# (by manually specifying the column name mappings)
path_cn_notpurple <- system.file("single_sample.copynumber.tsv", package = "sigstart")
sigminer_cn_dataframe <- parse_cnv_to_sigminer(
  path_cn_notpurple,
  sample_id = "tumor",
  col_chromosome = "chr",
  col_start = "start",
  col_end = "end",
  col_copynumber = "total_cn",
  col_minor_cn = "minor_cn"
)
```

## Cohort -\> Single Sample Files

Signature analysis tools including sigscreen and signal are easier to
run from single sample data files. Here we demonstrate how to split
common cohort/multisample filetypes into a collection of single-sample
files.

### Converting cohort MAF to single sample VCFs

Signature analysis tools including sigscreen and signal are easier to
run from single sample VCFs than cohort-MAFs. The convert_maf_to_vcfs
function splits a cohort MAF file into a collection of minimal single
sample vcfs.

``` r
# Split MAF into single sample VCFs
path_maf <- system.file(package = "sigstart", "snvs_indel.5sample.maf")
convert_maf_to_vcfs(
  path_maf, 
  outdir = "single_sample_files/vcfs", 
  verbose = FALSE
)

# Parse the vcfs 
# (no need to specify a sample ID since these are single sample VCFs)
maf <- parse_vcf_to_sigminer_maf("single_sample_files/vcfs/sampleA.snv_indel.vcf.bgz", verbose = FALSE)
head(maf)
#>    Chromosome Position_1based     ID Reference_Allele Tumor_Seq_Allele2  QUAL
#>        <char>           <num> <char>           <char>            <char> <num>
#> 1:          1         3359791      1                C                 T    NA
#> 2:          1         3766047      2                G                 A    NA
#> 3:          1         4201238      3                G                 A    NA
#> 4:          1         4655969      4               GC                AT    NA
#> 5:          1         4961889      5                G                 C    NA
#> 6:          1         5259976      6                T                 A    NA
#>    FILTER Tumor_Sample_Barcode  gt_GT gt_GT_alleles Ref_Length Alt_Length
#>    <char>               <char> <char>        <char>      <num>      <num>
#> 1:   <NA>              sampleA   <NA>          <NA>          1          1
#> 2:   <NA>              sampleA   <NA>          <NA>          1          1
#> 3:   <NA>              sampleA   <NA>          <NA>          1          1
#> 4:   <NA>              sampleA   <NA>          <NA>          2          2
#> 5:   <NA>              sampleA   <NA>          <NA>          1          1
#> 6:   <NA>              sampleA   <NA>          <NA>          1          1
#>    Start_Position End_Position Inframe Variant_Type
#>             <num>        <num>  <lgcl>       <char>
#> 1:        3359791      3359791    TRUE          SNP
#> 2:        3766047      3766047    TRUE          SNP
#> 3:        4201238      4201238    TRUE          SNP
#> 4:        4655969      4655970    TRUE          DNP
#> 5:        4961889      4961889    TRUE          SNP
#> 6:        5259976      5259976    TRUE          SNP
```

### Converting cohort copynumber calls into single sample segment VCFs

``` r
# Split cohort CNV segment files into single sample files 
path_copynumber <- system.file(package = "sigstart", "cohort.3sample.copynumber.hg38.tsv")
convert_cohort_segment_file_to_single_samples(
  path_copynumber, 
  outdir = "single_sample_files/cnvs", 
  verbose = FALSE
)

# Parse the copynumber file
cnv <- parse_cnv_to_sigminer("single_sample_files/cnvs/sampleA.copynumber.tsv.bgz", sample_id = "sampleA")
head(cnv)
#>    sample Chromosome  Start.bp    End.bp modal_cn minor_cn
#> 1 sampleA       chr1         1  86871328   2.8134   0.8115
#> 2 sampleA       chr1  86871329 117973563   2.0052   0.0000
#> 3 sampleA       chr1 117973564 117973598   1.2013   0.0000
#> 4 sampleA       chr1 117973599 123605522   2.0260   0.0000
#> 5 sampleA       chr1 123605523 143236173   6.0289   0.0000
#> 6 sampleA       chr1 143236174 148142020   3.9454   0.0000
```
