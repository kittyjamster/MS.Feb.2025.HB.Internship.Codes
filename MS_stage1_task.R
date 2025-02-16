####FUNCTION 1:: DNA into PROTEINS####
translator_table <- data.frame( #Codon reference table
  DNA_Codon = c("TTT", "TTC", "TTA", "TTG", "CTT", "CTC", "CTA", "CTG", "ATT", "ATC",
                "ATA", "ATG", "GTT", "GTC", "GTA", "GTG", "TCT", "TCC", "TCA", "TCG",
                "CCT", "CCC", "CCA", "CCG", "ACT", "ACC", "ACA", "ACG", "GCT", "GCC", 
                "GCA", "GCG", "TAT", "TAC", "TAA", "TAG", "CAT", "CAC", "CAA", "CAG",
                "AAT", "AAC", "AAA", "AAG", "GAT", "GAC", "GAA", "GAG", "TGT", "TGC",
                "TGA", "TGG", "CGT", "CGC", "CGA", "CGG", "AGT", "AGC", "AGA", "AGG",
                "GGT", "GCG", "GGA", "GGG"),
  Amino_Acid = c("Phe", "Phe", "Leu", "Leu", "Leu", "Leu", "Leu", "Leu", "Ile", "Ile",
                 "Ile", "Met", "Val", "Val", "Val", "Val", "Ser", "Ser", "Ser", "Ser",
                 "Pro", "Pro", "Pro", "Pro", "Thr", "Thr", "Thr", "Thr", "Ala", "Ala",
                 "Ala", "Ala", "Tyr", "Tyr", "STOP", "STOP", "His", "His", "Gln", "Gln",
                 "Asn", "Asn", "Lys", "Lys", "Asp", "Asp", "Glu", "Glu", "Cys", "Cys",
                 "STOP", "Trp", "Arg", "Arg", "Arg", "Arg", "Ser", "Ser", "Arg", "Arg",
                 "Gly", "Gly", "Gly", "Gly")
  )

#raw_dna -> input; can generate random seqs here: https://faculty.ucr.edu/~mmaduro/random.htm
dna_N2_protein <- function(raw.dna) { 
  threeify <- function (sequence, group_size = 3) { #function to split string into groups of 3
    positions <- seq(1, nchar(sequence), by = group_size) #Get postions to extract triplets
    
    codons <- sapply(positions, function(x)
      substring (sequence, x, x + group_size - 1)#extract groups
    )
    return (codons)
  }
  grouped <- threeify(raw.dna) #turns raw.dna into groups of 3
  matched_AA_ID <- c() #an empty vector that stores matched aa ID
  for (cdna in grouped) {
    protein_finder <- which(cdna == translator_table$DNA_Codon)
    if (length(protein_finder) > 0) {
      matched_AA_ID <- c(matched_AA_ID, translator_table$Amino_Acid[protein_finder])
      }
    } 
  return(matched_AA_ID) #should return corresponding amino acid matching dna input
}

dna_N2_protein ("ATGACAGCCGGGCATTGTTAG")




####FUNCTION 2: POPULATION GROWTH LOG EXPRESSION W/ RANDOMIZED LAG & EXP PHASES; MUST GEN A DATA FRAME w/ 100 different growth curves####
# t -> time, r -> growth rate, n -> start pop size, k -> carrying capacity, q -> lag time
#log growth function
grw_calc <- function(t, k, n, r, q) {
  k / (1 + ((k - n) / n) * exp(-r * (t - q)))
}

pop_growth <- function (t){
  trial_nums <- 100 #how many trials will be ran (curve that will be generated)
  time_range <- seq(0, 3, by = 1) #time range for each curve ran
  final_home <- data.frame(Trial_ID = integer(), #data frame to run each run
                           Time = integer(),
                           Pop = numeric(),
                           k = numeric(),
                           n = numeric(),
                           r = numeric(),
                           q = numeric())
  
  for (x in 1:trial_nums) {
    #randomizing the log phase
    k <- runif( 1, 272,544) #should randomize carrying capacity
    n <- runif (1, 4, 16) #should randomize starting pop
    r <- rnorm(1, mean = 0.5, sd = 0.12) #should fluctuate growth rate
    #randomizing the lag phase
    q <- sample(1:12, 1) #lag phase should vary between 1 and 12 of any time unit
    
    pop_vals <- sapply (time_range, grw_calc, k=k, n=n, r=r, q=q) #calculate pop val at each time point
    
    #temp home for data calculate
    temp_home <- data.frame (Trial_ID = rep(x, length(time_range)),
                             Time = time_range,
                             Pop = pop_vals,
                             k = rep(k, length(time_range)), 
                             n = rep(n, length(time_range)),
                             r = rep(r, length(time_range)),
                             q = rep(q, length (time_range)))
    
    #final home for cumulative data
    final_home <- rbind(final_home, temp_home)
                             
  }
  return(final_home)
}

#testing function
pop_growth(1)





####FUNCTION 3: DETERMINING 80% of MAX GROWTH (i.e. CARRYING CAPACITY)####
#k/(1 + ((k-n)/n) * exp(-r*(t - q))) becomes 
#t = q + ((-1/r)ln((0.25n)/(k-n))) when solved for 0.8k
almost_full <- function (n, k = 150,r = 0.5, q =1) {
  t <- q + ((-1/r)*(log((0.25 * n)/(k-n))))
  return(t)
}

almost_full(2)




####FUNCTION 4: HAMMING DISTANCE BETW SLACK UN AND OTHER UN####
#Hamming distances is the number of differences between two strings/vectors that are the same length

#sum(var1 != var2) is used to find the number of differences between two variables
UN_Ham_Dist <- function(slack_un, other_un) {
  slk_split <- strsplit (slack_un, "") [[1]] #strings split into individual characters
  othr_split <- strsplit (other_un,"") [[1]]
  ham_dist <- sum(slk_split != othr_split)
  return(ham_dist)
}

UN_Ham_Dist ("MikaylaS", "Jezzemay")


##Mikayla's Github found here:  https://github.com/kittyjamster/MS.Feb.2025.HB.Internship.Codes