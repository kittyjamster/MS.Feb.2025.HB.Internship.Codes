#my.list <- list( name = "Slinkie", age = 6, scores = c(30,25,27), data_set = mtcars)
# print(my.list) #list example

gene.info <- data.frame( #random selection of genes
  Gene_ID = c("TP53", "P13K", "BRCA1", "FGNR1", "SRY"),
  Function = c("tumor suppressor", "cell division control", "DNA repair", "growth factor", "sex determination")
)

#dna sequences below randomly generated from https://faculty.ucr.edu/~mmaduro/random.htm
dna.sequ <- c( "AACCTCTCGGTCGAC", "GCAAGCGATTACACT", "CCTGTCACATCATAA", "TCGTTTGCTATTCAG", "GGGTTGACCAACACC")

#gene expression matrix using arbitrary numbers 
exp.lv <- matrix(c(0.1,0.3,9.2,3.9,2.5, 3.1, 10.8, 7.1, 15.0, 6.9, 5.2, 5.5, 4.7, 1.8, 2.4), nrow=5, ncol=3)
rownames(exp.lv) <- c("TP53", "P13K", "BRCA1", "FGNR1", "SRY")
colnames(exp.lv) <- c("Sample1", "Sample2", "Sample3")

joined.info <- list( gene.info, dna.sequ, exp.lv)

print (joined.info)

#attempting to access different parts of gene.info data frame
gene.info$Gene_ID
gene.info$Function

#attempting to access different parts of exp.lv
exp.lv["TP53",]
exp.lv[,"Sample2"]
exp.lv["P13K", "Sample3"]
