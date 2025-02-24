#this code uses data from:https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt
#upregulated gene -> foldchange to log 2 (Log2FC) > 1 & pval < 0.01
#downregulated gene -> Log2FC < 1 & pval < 0.01

#setting a working directory
setwd("C:/Users/Mikitty/Documents/HB_Internship_2025")

#importing data
#url <- "https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt"
#destination <- "C:/Users/Mikitty/Documents/HB_Internship_2025/task_2_6_data.txt"

#download.file(url, destination)

#converting data into dataframe
rnaseq_data <- read.table("task_2_6_data.txt", header = TRUE, sep = " ", stringsAsFactors = FALSE)

#volcano plot with unadjusted p-vals
    #converting pvals into -log10 pvals (using regular pvals)
rnaseq_data$negLOG10_pvalue <- -log10(rnaseq_data$pvalue)

    #this defines what the significance categories will be: upregulated, downregulated, and not significant
rnaseq_data$sig <- ifelse(rnaseq_data$pvalue < 0.01 & rnaseq_data$log2FoldChange > 1, "Upregulated",
                     ifelse(rnaseq_data$pvalue < 0.01 & rnaseq_data$log2FoldChange < -1, "Downregulated",
                            "Not Significant"))
    #setting plot colors
colors <- ifelse(rnaseq_data$sig == "Upregulated", "orange", ifelse(rnaseq_data$sig == "Downregulated", "purple", "darkgray"))

    #the actual volcano plot
plot(rnaseq_data$log2FoldChange, rnaseq_data$negLOG10_pvalue,
     col = colors,
     pch = 17,
     xlab = "Log2 Fold Change",
     ylab = "-Log10 of P-value (unadjusted)",
     main = "Gene Regulation Significance")
    #plot legends
legend("top",
       legend = c("Upregulated", "Downregulated", "Not Significant"),
       col = c("orange", "purple", "darkgrey"),
       pch = 17)


#sorting the most up- and down-regulated genes by p-val & log2foldchange
    #upregulated genes
top_upreg <- rnaseq_data[rnaseq_data$log2FoldChange > 1 & rnaseq_data$pvalue < 0.01, ]
top_upreg <- top_upreg[order(top_upreg$pvalue, -top_upreg$log2FoldChange),] [1:10, ]

    #downregulated genes
top_downreg <- rnaseq_data[rnaseq_data$log2FoldChange < -1 & rnaseq_data$pvalue < 0.01, ]
top_downreg <- top_downreg[order(top_downreg$pvalue, -top_downreg$log2FoldChange),] [1:10, ]

    #printing up and down regulated data
print (top_upreg)
print (top_downreg)

### 5 TOP UPREG GENES INDLUDE: EMILIN2, POU3F4, LOC285954, VEPH1, & DTHD1 ###
  #1: EMILIN2 - Gene believed to be involved in anchoring smooth muscle, the formation of elastic fibers, and contributing to the regulating blood vessel assembly 
  #2: POU3F4 - a possible transcription factor; involved in neuron development via epigenetic signaling
  #3: LOC285954 - found in/near gene INHBA-AS1 ( which is a lncRNA, results in INHBA antisense RNA 1)
  #4: VEPH1 - potentially affects multiple signaling pathways, but definitely involved in negative regulation of SMAD and the TGFBR pathway 
  #5: DTHD1 - codes for a protein that is involved in the apoptosis signal pathway

### 5 TOP DOWNREG GENES INCLUDE: TBX5, LAMA2, CAV2, IFITM1, & TNN ### 
  #1: TBX5 - codes for a multi-gene transcription factor that is also involved in development of the heart and limb patterning
  #2: LAMA2 - codes for a subunit of the the laminin protein, which is found on the outer part of the cell membrane and is believed to be
    # involved in cellular movement, orgnaization, and attachment.
  #3: CAV2 - codes for a protein common on the surfaces of plasma cells; is involved in many cell processes such as signal transduction, lipid
    # metabolism, apoptosis, etc.
  #4: IFITM1 - one of a family of transmembrane proteins that work to prevent a variety of viruses from infiltrating across the cell membrane
  #5: TNN - a gene that codes for a protein that enables integrin's ability to bind; postively regulates angiogenesis; is also involved in the regulation
    # of both cell adhesion and cell migration


#GitHub found here: https://github.com/kittyjamster/MS.Feb.2025.HB.Internship.Codes
#LinkedIn post found here: https://www.linkedin.com/in/mikayla-sheild/
