# parse_vcf_to_sigminer_maf works correctly

    Code
      df_maf
    Output
         Chromosome Position_1based     ID Reference_Allele Tumor_Seq_Allele2  QUAL
             <char>           <num> <char>           <char>            <char> <num>
      1:          1               1   <NA>                C                 A    NA
      2:          1               2   <NA>                G                 T    NA
         FILTER Tumor_Sample_Barcode  gt_AD gt_GT_alleles Ref_Length Alt_Length
         <char>               <char> <char>        <char>      <num>      <num>
      1:   PASS               sample  47,15           C/A          1          1
      2:   PASS               sample   84,5           G/T          1          1
         Start_Position End_Position Inframe Variant_Type
                  <num>        <num>  <lgcl>       <char>
      1:              1            1    TRUE          SNP
      2:              2            2    TRUE          SNP

# parse_vcf_to_sigminer_maf works correctly with tumor_normal samples

    Code
      df_maf
    Output
           Chromosome Position_1based     ID Reference_Allele Tumor_Seq_Allele2  QUAL
               <char>           <num> <char>           <char>            <char> <num>
        1:       chr1         5091063   <NA>                A                 G   200
        2:       chr1         5360608   <NA>                A                 T   200
        3:       chr1         8592542   <NA>                G                 A   200
        4:       chr1        14497149   <NA>                C                 T   200
        5:       chr1        23387929   <NA>                G                 A   200
       ---                                                                           
      400:       chrX       108458621   <NA>                G                 A   200
      401:       chrX       122556128   <NA>                G                 A   200
      402:       chrX       124134012   <NA>                T                 A   200
      403:       chrX       140755568   <NA>                C                 T   200
      404:       chrX       152316310   <NA>                G                 A   200
           FILTER    AED BIALLELIC BIALLELIC_PROB CLNSIG CLNSIGCONF GND_FREQ HOTSPOT
           <char> <char>    <lgcl>          <num> <char>     <char>    <num>  <lgcl>
        1:   PASS  40,43      TRUE         0.0196   <NA>       <NA>       NA   FALSE
        2:   PASS  35,37      TRUE         0.0196   <NA>       <NA>       NA   FALSE
        3:   PASS  38,42      TRUE         0.0405   <NA>       <NA>       NA   FALSE
        4:   PASS  35,37      TRUE         0.0223   <NA>       <NA>       NA   FALSE
        5:   PASS  34,31      TRUE         0.0322   <NA>       <NA>       NA   FALSE
       ---                                                                          
      400:   PASS  32,32      TRUE         0.9456   <NA>       <NA>       NA   FALSE
      401:   PASS  38,38      TRUE         0.9313   <NA>       <NA>       NA   FALSE
      402:   PASS  41,41      TRUE         0.9655   <NA>       <NA>       NA   FALSE
      403:   PASS  40,40      TRUE         0.9633   <NA>       <NA>       NA   FALSE
      404:   PASS  41,41      TRUE         0.9264   <NA>       <NA>       NA   FALSE
                                                                                IMPACT
                                                                                <char>
        1:        LINC02782,ENST00000443270,upstream_gene_variant,NONE,false,,,,NONE,1
        2:                                                                        <NA>
        3:      RERE,ENST00000400908,intron_variant,NONE,false,c.522+22019C>T,,,NONE,1
        4:                                                     ,,,NONE,false,,,,NONE,1
        5:       TCEA3,ENST00000450454,intron_variant,NONE,false,c.820-510C>T,,,NONE,1
       ---                                                                            
      400:     COL4A5,ENST00000328300,intron_variant,NONE,false,c.81+18415G>A,,,NONE,1
      401:                                                                        <NA>
      402:                                                     ,,,NONE,false,,,,NONE,1
      403: LINC00632,ENST00000648200,intron_variant,NONE,false,n.192-16510C>T,,,NONE,1
      404:    GABRA3,ENST00000370314,intron_variant,NONE,false,c.262+29271C>T,,,NONE,1
               KT    LPS LPS_RC MAPPABILITY   MED     MH   MQF NEARBY_INDEL
           <char> <char> <char>       <num> <int> <char> <num>       <lgcl>
        1:   <NA>     35      4           1    75   <NA> 32.50        FALSE
        2:   <NA>   <NA>   <NA>           1    72   <NA> 32.85        FALSE
        3:   <NA>   <NA>   <NA>           1    72   <NA> 28.96        FALSE
        4:   <NA>   <NA>   <NA>           1    74   <NA> 32.71        FALSE
        5:   <NA>     98     42           1    74   <NA> 25.31        FALSE
       ---                                                                 
      400:   <NA>  11370     14           1    72   <NA> 31.10        FALSE
      401:   <NA>   <NA>   <NA>           1    75   <NA> 35.00        FALSE
      402:   <NA>   <NA>   <NA>           1    74   <NA> 32.17        FALSE
      403:   <NA>   <NA>   <NA>           1    74   <NA> 32.68        FALSE
      404:   <NA>   <NA>   <NA>           1    68   <NA> 29.33        FALSE
           NEAR_HOTSPOT
                 <lgcl>
        1:        FALSE
        2:        FALSE
        3:        FALSE
        4:        FALSE
        5:        FALSE
       ---             
      400:        FALSE
      401:        FALSE
      402:        FALSE
      403:        FALSE
      404:        FALSE
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                PAVE_TI
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <char>
        1:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ENSG00000231510|LINC02782|ENST00000443270|upstream_gene_variant|false||
        2:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
        3:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ENSG00000142599|RERE|ENST00000337907|intron_variant|false|c.522+22019C>T|,ENSG00000142599|RERE|ENST00000400908|intron_variant|false|c.522+22019C>T|,ENSG00000142599|RERE|ENST00000400907|intron_variant|false|c.522+22019C>T|,ENSG00000142599|RERE|ENST00000656437|intron_variant|false|c.522+22019C>T|,ENSG00000142599|RERE|ENST00000659924|intron_variant|false|c.522+22019C>T|,ENSG00000142599|RERE|ENST00000480342|intron_variant|false|n.1074+22019C>T|,ENSG00000142599|RERE|ENST00000514428|intron_variant|false|c.69+31768C>T|
        4:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ENSG00000189337|KAZN|ENST00000636203|intron_variant|false|c.250-101834C>T|
        5:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ENSG00000204219|TCEA3|ENST00000450454|intron_variant|false|c.820-510C>T|,ENSG00000204219|TCEA3|ENST00000476978|intron_variant|false|c.820-510C>T|
       ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
      400:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ENSG00000188153|COL4A5|ENST00000328300|intron_variant|false|c.81+18415G>A|,ENSG00000188153|COL4A5|ENST00000361603|intron_variant|false|c.81+18415G>A|,ENSG00000188153|COL4A5|ENST00000642185|intron_variant|false|c.*123-3813G>A|,ENSG00000188153|COL4A5|ENST00000470339|intron_variant|false|n.265+18415G>A|
      401:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         <NA>
      402:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ENSG00000101972|STAG2|ENST00000469481|intron_variant|false|n.453+130265T>A|
      403: ENSG00000203930|LINC00632|ENST00000607004|intron_variant|false|n.5001-16510C>T|,ENSG00000203930|LINC00632|ENST00000649192|intron_variant|false|n.2968-16510C>T|,ENSG00000203930|LINC00632|ENST00000660897|intron_variant|false|n.4828-16510C>T|,ENSG00000203930|LINC00632|ENST00000648200|intron_variant|false|n.192-16510C>T|,ENSG00000203930|LINC00632|ENST00000498732|intron_variant|false|n.293-16510C>T|,ENSG00000203930|LINC00632|ENST00000648508|intron_variant|false|n.171-16510C>T|,ENSG00000203930|LINC00632|ENST00000659304|intron_variant|false|n.2944-12772C>T|,ENSG00000203930|LINC00632|ENST00000648186|intron_variant|false|n.171-16510C>T|,ENSG00000203930|LINC00632|ENST00000650626|intron_variant|false|n.346-16510C>T|,ENSG00000203930|LINC00632|ENST00000647949|intron_variant|false|n.76-16510C>T|,ENSG00000203930|LINC00632|ENST00000649160|intron_variant|false|n.224-16510C>T|,ENSG00000203930|LINC00632|ENST00000649329|intron_variant|false|n.163-16510C>T|,ENSG00000203930|LINC00632|ENST00000650090|intron_variant|false|n.154-12772C>T|,ENSG00000203930|LINC00632|ENST00000650128|intron_variant|false|n.153-16510C>T|,ENSG00000203930|LINC00632|ENST00000650158|intron_variant|false|n.150-16510C>T|,ENSG00000203930|LINC00632|ENST00000602830|intron_variant|false|n.679-16510C>T|,ENSG00000203930|LINC00632|ENST00000649535|intron_variant|false|n.517-15356C>T|,ENSG00000203930|LINC00632|ENST00000647853|intron_variant|false|n.543-16510C>T|,ENSG00000203930|LINC00632|ENST00000658451|intron_variant|false|n.88+21604C>T|,ENSG00000203930|LINC00632|ENST00000625883|intron_variant|false|n.87+21604C>T|
      404:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ENSG00000011677|GABRA3|ENST00000370314|intron_variant|false|c.262+29271C>T|,ENSG00000011677|GABRA3|ENST00000535043|intron_variant|false|c.262+29271C>T|
           PURPLE_AF PURPLE_CN PURPLE_MACN PURPLE_VCN
               <num>     <num>       <num>      <num>
        1:    0.2605      2.81       0.812      0.733
        2:    0.2910      2.81       0.812      0.819
        3:    0.7350      2.81       0.812      2.070
        4:    0.5891      2.81       0.812      1.660
        5:    0.6935      2.81       0.812      1.950
       ---                                           
      400:    1.0052      1.96       0.000      1.970
      401:    1.0052      1.96       0.000      1.970
      402:    1.0052      1.96       0.000      1.970
      403:    1.0052      1.96       0.000      1.970
      404:    0.9278      1.96       0.000      1.810
                                                       RC_INFO  RC_MH RC_NM RC_REPC
                                                        <char> <char> <int>   <int>
        1:          5091051-12-TCTCACACAT-ATGAA-GTGCTGAATA-25M   <NA>     1      NA
        2:      5360596-12-CACAGGATTA-TCTTGGGGA-GGGAGGAACT-29M   <NA>     1       4
        3:          8592530-12-CCAAAGTGCT-GGAAT-TACAGGCATG-25M   <NA>     1      NA
        4:   14497136-13-CATACGCCTT-ATTTTCTCTCC-AACTCTGATA-31M   <NA>     1       4
        5:         23387917-12-TGAAGCTCCT-GGACT-CACACAACTA-25M   <NA>     2      NA
       ---                                                                         
      400:    108458609-12-GGTCATTTTT-GGAAAAAAT-GATGTCTTAA-29M   <NA>     1       6
      401:     122556113-15-GGCACTTGGT-TCCCTAAG-CCCAGCCGCT-28M   <NA>     1       3
      402:        124134000-12-TGAGGTCAGG-AGATC-AAGACCAGCC-25M   <NA>     1      NA
      403:        140755556-12-TGCACGGTGA-TGTCT-CCAGAACAGA-25M   <NA>     1      NA
      404: 152316296-14-CCAACAAACA-CAAAAAAAAAAG-AATTAAAACT-32M   <NA>     1      10
           RC_REPS REPORTABLE_TRANSCRIPTS REPORTED REP_C  REP_S SUBCL            TIER
            <char>                 <char>   <lgcl> <int> <char> <num>          <char>
        1:    <NA>                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
        2:       G                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
        3:    <NA>                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
        4:       T                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
        5:    <NA>                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
       ---                                                                           
      400:       A                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
      401:       C                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
      402:    <NA>                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
      403:    <NA>                   <NA>    FALSE    NA   <NA>     0 HIGH_CONFIDENCE
      404:       A                   <NA>    FALSE    NA   <NA>     0  LOW_CONFIDENCE
           TINC_RECOVERED    TNC   TQP Tumor_Sample_Barcode gt_ABQ  gt_AD gt_AF
                   <lgcl> <char> <num>               <char> <char> <char> <num>
        1:          FALSE    TAA     0                tumor  45,45  43,15 0.259
        2:          FALSE    CAT     0                tumor  48,47  31,13 0.289
        3:          FALSE    GGA     0                tumor  44,43  10,27 0.730
        4:          FALSE    TCT     0                tumor  48,48  21,31 0.585
        5:          FALSE    GGC     0                tumor  44,44  19,42 0.689
       ---                                                                     
      400:          FALSE    GGA     0                tumor  47,47   0,30 1.000
      401:          FALSE    TGA     0                tumor  46,46   0,27 1.000
      402:          FALSE    GTT     0                tumor  49,49   0,36 1.000
      403:          FALSE    GCC     0                tumor  44,44   0,37 1.000
      404:          FALSE    AGA     0                tumor  45,45   0,36 0.923
           gt_AMBQ gt_AMMQ gt_AMQ gt_DP  gt_GT      gt_RC_CNT gt_RC_IPC gt_RC_JIT
             <int>   <int> <char> <int> <char>         <char>     <int>    <char>
        1:      33      58  60,60    58    0/1 14,0,1,0,43,58         0       0,0
        2:      34      58  60,60    45    0/1 13,0,0,0,31,45         0       0,0
        3:      31      54  60,60    37    0/1 27,0,0,0,10,37         1       0,0
        4:      36      58  60,60    53    0/1 31,0,0,0,21,53         1       0,0
        5:      32      50  60,60    61    0/1 41,1,0,0,19,61         1       0,0
       ---                                                                       
      400:      34      56  60,60    30    1/1  29,1,0,0,0,30         0       0,0
      401:      33      60  60,60    27    1/1  25,2,0,0,0,27         0       0,0
      402:      37      57  59,59    36    1/1  36,0,0,0,0,36         0       0,0
      403:      31      58  60,60    37    1/1  37,0,0,0,0,37         1       0,0
      404:      33      54  60,60    39    1/1  36,0,0,0,0,39         0       2,1
                     gt_RC_QUAL      gt_RSB gt_SAC       gt_SB gt_UMI_CNT
                         <char>      <char>  <int>      <char>     <char>
        1: 450,0,31,0,1349,1830 0.674,0.533      0 0.628,0.467       <NA>
        2:  439,0,0,0,1091,1530 0.455,0.615      0 0.531,0.308       <NA>
        3:   799,0,0,0,298,1097   0.6,0.333      0   0.5,0.444       <NA>
        4:  1080,0,0,0,730,1844 0.364,0.645      0 0.773,0.467       <NA>
        5: 1285,15,0,0,597,1897 0.421,0.524      0 0.316,0.512       <NA>
       ---                                                               
      400:    973,35,0,0,0,1008   0.5,0.633      0   0.5,0.567       <NA>
      401:     839,46,0,0,0,885   0.5,0.481      0    0.5,0.63       <NA>
      402:    1288,0,0,0,0,1288    0.5,0.27      0   0.5,0.556       <NA>
      403:    1120,0,0,0,0,1120   0.5,0.432      0   0.5,0.486       <NA>
      404:    1118,0,0,0,0,1212 0.667,0.528      0 0.667,0.528       <NA>
           gt_GT_alleles Ref_Length Alt_Length Start_Position End_Position Inframe
                  <char>      <num>      <num>          <num>        <num>  <lgcl>
        1:           A/G          1          1        5091063      5091063    TRUE
        2:           A/T          1          1        5360608      5360608    TRUE
        3:           G/A          1          1        8592542      8592542    TRUE
        4:           C/T          1          1       14497149     14497149    TRUE
        5:           G/A          1          1       23387929     23387929    TRUE
       ---                                                                        
      400:           A/A          1          1      108458621    108458621    TRUE
      401:           A/A          1          1      122556128    122556128    TRUE
      402:           A/A          1          1      124134012    124134012    TRUE
      403:           T/T          1          1      140755568    140755568    TRUE
      404:           A/A          1          1      152316310    152316310    TRUE
           Variant_Type
                 <char>
        1:          SNP
        2:          SNP
        3:          SNP
        4:          SNP
        5:          SNP
       ---             
      400:          SNP
      401:          SNP
      402:          SNP
      403:          SNP
      404:          SNP

# parse_purple_sv_vcf_to_bedpe works correctly

    Code
      bedpe
    Output
        chrom1    start1      end1 chrom2    start2      end2
      1   chr4 110991334 110991335   chr4 110991359 110991360
      2   chr4 116333453 116333454   chr4 116333454 116333455
      3   chr8  14119474  14119475   chr8  14119476  14119477
      4  chr17  52985911  52985912  chr17  52985912  52985913
                                                  name score strand1 strand2
      1 chr4:110991335_TAACTGTATAAAAAGCTTTCTCATG/T_bp1   200       +       -
      2                        chr4:116333454_G/GA_bp1   200       +       -
      3                         chr8:14119475_GT/G_bp1   200       +       -
      4                        chr17:52985912_T/TG_bp1   200       +       -

# parse_purple_sv_vcf_to_sigminer works correctly

    Code
      sigminer
    Output
        Sample  chr1    start1      end1  chr2    start2      end2
      1 Sample  chr4 110991334 110991335  chr4 110991359 110991360
      2 Sample  chr4 116333453 116333454  chr4 116333454 116333455
      3 Sample  chr8  14119474  14119475  chr8  14119476  14119477
      4 Sample chr17  52985911  52985912 chr17  52985912  52985913
                                                  name score strand1 strand2
      1 chr4:110991335_TAACTGTATAAAAAGCTTTCTCATG/T_bp1   200       +       -
      2                        chr4:116333454_G/GA_bp1   200       +       -
      3                         chr8:14119475_GT/G_bp1   200       +       -
      4                        chr17:52985912_T/TG_bp1   200       +       -
          svclass
      1 inversion
      2 inversion
      3 inversion
      4 inversion

