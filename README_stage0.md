
# Team Tryptophan's Organized Data

This project was meant to organize specific data of the Tryptophan team members neatly. Data collected included: team member's names, their Slack usernames, email addresses, home countries, disciplines, hobbies, and programming language preferences (between Python and R).

*Note: Some info was not provided from teammates (one team did not disclose their hobbies and the other did not include their programming language preference).*

I, as the R coder, had extra time on my hands and opted to approach this task from two angles. 

**Approach 1:** Data Frame
Using data.frame(), data was compiled into 7 categories that correlated to data collected. In the code, they are referred to as: Name, Slack.UN, email, Country, Discipline, Hobbies, and LanguagePref. Each category contains a vector of corresponding information provided by each team member. Dataframe was assigned to the variable "my.team". Using the print(my.team) command displays the my.team data frame.

**Approach 2** Matrix
A matrix can also be used to compile the data provided. Utilizing matrix(), data was compiled into a matrix with 6 rows and 4 columns and assigned to the variable "alt_team_form". Team members' names served as column names and the remaining 6 data categories served as row names (those being: Slack.UN, Email, Country, Discipline, Hobbies, and LanguagePref.) Using the print(alt_team_form) command prints the alt_team_form matrix.