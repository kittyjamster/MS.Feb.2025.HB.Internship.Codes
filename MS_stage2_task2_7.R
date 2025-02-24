#code using data from: https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/nhanes.csv
#inspired by the NHANES program run by the CDC

#setting a working directory
setwd("C:/Users/Mikitty/Documents/HB_Internship_2025")

#importing data
#data dictonary found here: https://github.com/HackBio-Internship/public_datasets/blob/main/R/nhanes_dd.csv
nhanes_raw <- read.csv("nhanes.csv")

#histogram 1: BMI Ditribution
hist(nhanes_raw$BMI[!is.na(nhanes_raw$BMI)], 
     col= "darkblue", 
     xlab = "BMI",
     main= "BMI Distribution among NHANES Sample", 
     ylim= c(0, 1400))
#histogram 2: Weight (in kg) distribution
hist(nhanes_raw$Weight[!is.na(nhanes_raw$Weight)], 
     col="darkred", 
     xlab = "Weight (kg)", 
     main = "Weight (kg) Distribution among NHANES Sample",
     ylim= c(0, 2000))
#histogram 3: weight (in lbs) distribution
nhanes_raw$Weight_lbs <- nhanes_raw$Weight * 2.2
hist(nhanes_raw$Weight_lbs[!is.na(nhanes_raw$Weight_lbs)], 
     col="darkgreen", 
     xlab = "Weight (lbs)", 
     main = "Weight (lbs) Distribution among NHANES Sample",
     ylim= c(0, 2000),
     xlim = c(0, 500))
#histogram 4: age (in years) distribution
hist(nhanes_raw$Age[!is.na(nhanes_raw$Age)],
     col = "gold",
     xlab = "Age (in years)",
     main = "Age Distribution among NHANES Sample",
     ylim = c(0, 500))


#mean of 60-sec pulse 
mean_wo_na <- mean(nhanes_raw$Pulse, na.rm = T)
print(mean_wo_na)

#range for diastolic w/o na
min_wo_na <- min(nhanes_raw$BPDia, na.rm = T)
max_wo_na <- max (nhanes_raw$BPDia, na.rm = T)

paste("Range for diastolic bp when NA isn't considered is:", min_wo_na, "and", max_wo_na)

#Variance & SD for income
var_wo_na <- var (nhanes_raw$Income, na.rm =T)
sd_wo_na <- sd(nhanes_raw$Income, na.rm = T)

paste("When NA is excluded for income, variance is", var_wo_na, "and SD is", sd_wo_na, ".")

#omitting NA values from height and weight -> ensures the same data is considered for each of the histograms below
h_w_omit <- nhanes_raw[!is.na(nhanes_raw$Height) & !is.na(nhanes_raw$Weight), ]

#print(head(h_w))
#height x weight plot 1; gender 
plot(h_w_omit$Height, h_w_omit$Weight,
     col = c("pink","lightblue")[as.factor(h_w_omit$Gender)],
     pch= 16,
     xlab = "Height(cm)", ylab = "Weight (kg)",
     main = "NHANES Height-Weight Relationship in Regard to Gender")

    #legend for heightxweight gender plot
legend("left", legend = levels(as.factor(h_w_omit$Gender)), 
       col = c("pink","lightblue"), pch = 16)

#height x weight plot 2: Diabetes
plot(h_w_omit$Height, h_w_omit$Weight, 
     col = c("red", "green")[as.factor(h_w_omit$Diabetes)], 
     pch = 19,
     xlab = "Height (cm)", ylab = "Weight (kg)",
     main = "NHANES Height-Weight Relationship in Regard to Diabetes Status")

legend("topleft", legend = levels(as.factor(h_w_omit$Diabetes)), 
       col = c("red", "green"), pch = 19)

#height x weight plot 3: smoking status
plot(h_w_omit$Height, h_w_omit$Weight, 
     col = as.factor(h_w_omit$SmokingStatus), 
     pch = 18,
     xlab = "Height (cm)", ylab = "Weight (kg)",
     main = "NHANES Height-Weight Relationship in Regard to Diabetes Status")

legend("topleft", legend = levels(as.factor(h_w_omit$SmokingStatus)), 
       col = 1:length(levels(as.factor(h_w_omit$SmokingStatus))), pch = 18)

          ###Statistical analyses###
#t-test for age & gender
a_g_omit <-na.omit(nhanes_raw[, c("Age", "Gender")]) #removes any rows with NA vals found in Age or Gender from nhanes raw data

male_age <- a_g_omit$Age[a_g_omit$Gender == "male"] #ages of male population
female_age <- a_g_omit$Age[a_g_omit$Gender == "female"] #ages of female population

t.test(male_age, female_age)
      #With a p-val = 0.08022 and being larger than a = 0.05, the data suggests that there is no significant correlation between an individual's age and gender.

#t-test for BMI & Diabetes
b_d_omit <-na.omit(nhanes_raw[, c("BMI", "Diabetes")]) #removes any rows with NA vals found in BMI & Diabetes from nhanes raw data

no_diaB <- b_d_omit$BMI[b_d_omit$Diabetes == "No"] #bmi of diabetes negative population
yes_diaB <- b_d_omit$BMI[b_d_omit$Diabetes == "Yes"]#bmi of diabetes positive population

t.test(no_diaB, yes_diaB)
      #With a p-val < 2.2e-16 and being much smaller than a = 0.05, there appears to be a significant correlation between an individual's BMI score and whether they have diabetes.

#t-test for Alcohol year and relationship status
r_ay_omit <- na.omit (nhanes_raw[, c("AlcoholYear", "RelationshipStatus")])

single <- r_ay_omit$AlcoholYear[r_ay_omit$RelationshipStatus == "Single"]
committed <- r_ay_omit$AlcoholYear[r_ay_omit$RelationshipStatus == "Committed"]

t.test(single, committed)
      #With a p-val < 6.09e-8 and being much smaller than a = 0.05, there appears to be a significant correlation between how much an individual drinks in a year and their relationship status.


#GitHub found here: https://github.com/kittyjamster/MS.Feb.2025.HB.Internship.Codes
#LinkedIn post found here: https://www.linkedin.com/in/mikayla-sheild/
