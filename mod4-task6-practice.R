#my_func <- function(argument1, argument2) {
  #code to perform task
#  result <- agrument1- argument2
#  return(result)
#} ---

#when using your own function, you must first create the function then later call the function


#BMI calculation function
bmi_calc <- function(weight, height) { #weight in kg, height in meters
  bmi <- weight/(height^2)
  return(bmi)
}
bmi_calc(50,1.2)


#BMR is basal metabolic rate, it's the prodcut of weight in kg, height in cm, and age in years
#1 is 1 meter, centimeters have to be entered as decimals
BMR_Func <- function(weight_kg, height_cm, age_years) {
  BMR <- weight_kg*height_cm*age_years
  return(BMR)
}
BMR_Func(25,0.52,4)

#calculating bacterial growth rate using initial population, start time, final population, and end time
bac_growth_rate_func <- function (start.pop, start.time, final.pop, end.time){ #time measured in minutes and populations measured in number of individual cells (if quantifiable)
  BGR <- ((final.pop - start.pop)/(end.time-start.time)) * 100 #returns a percentage
  return (BGR)
}
bac_growth_rate_func (2, 0, 128, 120)

#write a function that accepts a single DNA base and converts it to RNA base
DNA_n2_RNA <- function(dna.base){
  rna.base <- "u"
  if (dna.base == "t") {
    return(rna.base)
  } else {
    return(dna.base)
  }
}

DNA_n2_RNA("a")
DNA_n2_RNA("t")

#create a function that reads data from url, looks for a specifc gene, and prints only subset of that gene as a dataframe
gene_hunt_func <- function(Gene) {
  data <- read.table("C:/Users/Mikitty/Documents/HB Internship 2025/HB_Practice_Data/rnaseq_data.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
  GOI <- subset (data, SYMBOL == Gene)
  return (GOI)
}

gene_hunt_func("Egf")

gene_hunt_func("Egf")