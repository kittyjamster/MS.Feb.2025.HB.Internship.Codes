#Write an R script to classify a DNA base as a purine or a pyrimidine. 
#In DNA, purines are A (adenine) and G (guanine), while pyrimidines are C (cytosine) 
#and T (thymine). If the input is not a valid DNA or RNA base, print an error message.

pyr <- "pyrimidine"
pur <- "purine"

a <- "adenine"
t <- "thymine"
c <- "cytosine"
g <- "guanine"
u <- "uracil"
o <- "other"

dnabase <- t #input nucleotide here

if (dnabase==a) {
  paste ("The nucleotide is a", pur, ".")
} else if (dnabase==g) {
  paste ("The nucleotide is a", pur, ".")
} else if (dnabase==t) {
  paste ("The nucleotide is a", pyr, ".")
} else if (dnabase==c) {
  paste ("The nucleotide is a", pyr, ".")
} else if (dnabase==u) {
  paste ("The nucleotide is a", pyr, ".")
} else {
  paste ("ERROR: The nucleotide is not a recongnized input.")
}

