#code using data from https://github.com/HackBio-Internship/public_datasets/tree/main/R/datasets, 
#which was inspired by Galardini et al's 2018 study: https://elifesciences.org/articles/31035#abstract

#Note: sift < 0.05 and foldx > 2 kCal/mol are both deleterious (Galardini et al., 2018)

#setting a working directory
setwd("C:/Users/Mikitty/Documents/HB_Internship_2025")

#importing data
sift_data <- read.table("sift_v2.tsv", header = TRUE, sep = "\t")
foldx_data <- read.table("foldX_v2.tsv", header = TRUE, sep ="\t")

sift_data$specific_protein_aa <-paste(sift_data$Protein, sift_data$Amino_Acid, sep = "_")
foldx_data$specific_protein_aa <-paste(foldx_data$Protein, foldx_data$Amino_Acid, sep = "_")

#joining dataframes
cumul_data <- merge(sift_data, foldx_data, by = c("Protein", "Amino_Acid", "specific_protein_aa"))

#subsetting cumul_data for sift <0.05 and foldx >2
deltier_data <- subset(cumul_data, sift_Score < 0.05 & foldX_Score > 2)

#need to find the amino acid associated with structural and functional mutations
mutation_aa <-c() #empty vector to store counted amino acids

for (aa in deltier_data$Amino_Acid){
  mutation_aa <- c(mutation_aa, substr(aa, 1, 1))
}

#frequency of each aa associated with sift < 0.05 and foldx > 2
aa_freq <- table(mutation_aa)

#checking data
print(aa_freq)

#visualization of frequency
#first method: barchart
aa_freq_bar <- barplot(aa_freq,
                       col="purple",
                       main = "Ammino Acid Counts associated w/ Mutations",
                       xlab = "Amino Acid ID",
                       ylab = "Number of Observations",
                       ylim = c(0, max(aa_freq) + 100))
#adding barplot labels
text(x = aa_freq_bar,  
     y = aa_freq + 30,   
     labels = aa_freq,   
     col = "black",      
     cex = 1.2,          
     font = 2) 


#Second method: piechart
percent_lb <- round((aa_freq/sum(aa_freq))*100,1) #should convert values into percentages
labels <- paste (names(aa_freq), percent_lb, "%")
pie(aa_freq, labels=labels, main = "Ammino Acids Freq. Associated w/ Mutations")


###QUESTIONS####
#1: What amino acid had the highest impact on protein structure and function?
    #ANS: The amino acid with the most occurrences was G (aka Glycine), a neutral, non-polar amino acid with a simple structure.

#2: What can you say about the structural and functional properties of amino acids with more than 100 occurrences?
    #ANS: The amino acids with 100+ include Alanine (A), Apartate (D), Phenylalanine (F),
      #Glycine (G), Isoleucine (I), Leucine (L), Proline (P), Ariginine (R), Serine (S), 
      #Threonine (T), Valine (V), Tryptophan (W), and Tyrosine (Y).

    #Most amino acids with 100+ observations are neutral, non-polar aa, with the exceptions being D, R, Y, T, S.
      #S,T, & Y are neutral, polar aas, and R(+) and D(-) are charged aas. Due to protein structure & function being closely related and influenced by 
      #molecular interactions between aas, nonpolar aa mutations have a noticable impact on the final protein product. This is potentially a result of
      #limited molecular interactions in 2nd, 3rd, and 4th protein structure levels that would arise with a higher presence of neutral nonpoplar aas.


#GitHub found here: https://github.com/kittyjamster/MS.Feb.2025.HB.Internship.Codes
#LinkedIn post found here: https://www.linkedin.com/in/mikayla-sheild/


