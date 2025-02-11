#practicing sample() func, format is (vector, numb of values to choose, replace = t/f, prob = null or a vector)
#replace = t/f determines if same number can be chosen multiple times; prob allows for weighted probability (like with grades)
#sample () fuction is used to randomly select values from a vector
plant_height <- sample(1:32, 7, replace= F, prob = NULL) 

print(plant_height)

mean(plant_height)
median(plant_height)
#sd(x, na.rm = t/f) format; x is a vector, na.rm removes any NA values whenever = TRUE
sd(plant_height) 

#sort() is used to sort vectors and defaults to ascending order
#sort(ex.dataset, decreasing = TRUE) would be used to sort in descending order
#sort(ex.dataset, na.last = TRUE) would be used to put any NA values in a vector at the end
sort(plant_height)

#practicing seq() func, format is (from, to, by), from is the starting val, to is the ending val, and by is the step size
#seq() func generates a sequence of numbers
CFU <- seq (4, 200, by=5)
print(CFU)

range(CFU)
IQR(CFU)

#to determine number or rows in a dataset, use nrow(ex.dataset) or ncol(ex.dataset)
#can also use dim(ex.dataset) to find both number of rows and columns of a dataset
#length(ex.dataset) can also be used to find num of columns if data is organized in a dataframe
nrow(Orange)
ncol(Orange)
dim(Orange)

#subset() format is (ex.dataset, condition, select = columns); ex.dataset must either be matrix or dataframe; 
#select = columns is opt. and chooses specific columns
sing.tree <- subset(Orange, Tree == 1)
print(sing.tree)

#nchar() is used to count number of characters in a string or a vector of strings
name <- "Mikayla"
nchar(name)
