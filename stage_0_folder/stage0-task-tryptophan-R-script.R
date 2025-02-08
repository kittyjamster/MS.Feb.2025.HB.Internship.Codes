#stage 0 task: structure data of all team members without using complex concepts (i.e. functions, loops, conditionals, etc.)
#data included: Names, Slack.UN, email address, hobby, countries, discipline, preferred programming language

#opted for data frame format (alternative could be a matrix)
my.team <- data.frame(
  Name = c ("Mikayla Sheild", "Valentim", "Josiah"),
  Slack.UN = c("Mikayla", "José Valentim", "Josiah"),
  email = c("msheild.1218@gmail.com", "jose.valentimfilhoUK@gmail.com", "josiaholubanjo@gmail.com"),
  Country = c("The US", "Brazil", "Nigeria"),
  Discipline = c("Genetics & Genomics", "Electronic Engineering", "Biochemistry"),
  Hobbies = c("Reading & writing", "Football", "Reading"),
  LanguagePref = c( "R", "Python", "Python") #LanguagePref refers to preferred programming language
)

#printing my.team info
print(my.team)

#had the time to include an alternate format
#alternative structure in matrix format
alt_team_form <- matrix (c("Mikayla", "msheild.1218@gmail.com", "TheUS", "Genetics&Genomics", "Reading&Writing", "R", 
                           "José Valentim", "jose.valentimfilhoUK@gmail.com", "Brazil", "ElectronicEngineering", "INFO HERE", "Python",
                           "Josiah", "josiaholubanjo@gmail.com", "Nigeria", "Biochemistry", "Reading", "Python"), nrow=6, ncol=3)

#team members' names are serving as column names
colnames(alt_team_form) <- c("Mikayla Sheild", "Valentim", "Josiah")
rownames(alt_team_form) <- c("Slack.UN", "Email", "Country", "Discipline", "Hobbies", "LanguagePref")

#Printing matrix format
print(alt_team_form)

#Mikayla's github can be found here: https://github.com/kittyjamster/MS.Feb.2025.HB.Internship.Codes 
