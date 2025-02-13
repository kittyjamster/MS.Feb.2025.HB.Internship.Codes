#creating data frame of amino acid information
aa_info_df <- data.frame(
  Amino_Acid = c("Alanine", "Arginine", "Asparagine", "Aspartic_Acid", "Cysteine", "Glutamic_Acid", "Glutamine", "Glycine", "Histidine", "Isoleucine", "Leucine", "Lysine", "Methionine", "Phenylalanine", "Proline", "Serine", "Threonine", "Tryptophan", "Tyrosine", "Valine"),
  Three_Lets = c ("Ala", "Arg", "Asn", "Asp", "Cys", "Glu", "Gln", "Gly", "His", "Ile", "Leu", "Lys", "Met", "Phe", "Pro", "Ser", "Thr", "Trp", "Tyr", "Val"),
  One_Let = c ("A", "R", "N", "D", "C","E", "Q", "G", "H", "I", "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V"),
  Weight_Daltons = c(89.09, 174.20, 132.12, 133.10, 121.15, 147.13, 146.15, 75.07, 155.16, 131.18, 131.18, 146.19, 149.21, 165.19, 115.13, 105.09, 119.12, 204.23, 181.19, 117.15)
)

#strsplit(my.var, "") [[1]] -> will split a string input into a vector of single characters

#creating function; input = protein
pro_weight_calc <- function(protein) {
  pro_weight <- c() #an empty vector that stores matched aa mass
  indivi <- strsplit(protein, "")[[1]]
  
  for (lett in indivi){
    letter_match <- which(aa_info_df$One_Let == lett) #matches the split letters of the protein input to the One_Let column in aa_info_df
    if (length(letter_match)>0) {
      pro_weight <- c(pro_weight, aa_info_df$Weight_Daltons[letter_match]) #should store corresponding aa weight in daltons to pro_weight vector
    } else {
      pro_weight <- c(pro_weight, 0) # should store a 0 val for characters not matched to aa_info_df
    }
  }
  #dalton into kilodalton -> divide sum(dalton_weight) by 1000
  dalton_weight <- sum(pro_weight)
  final_weight <- dalton_weight/1000
  return (final_weight)
}
pro_weight_calc ("SLINKIE") #Input protein here, must be completely uppercase with no spaces
