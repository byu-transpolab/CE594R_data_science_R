### Look at different data.types beyond values and vectors

## lists


#Make a list. 
list1 <- list(1, "word", 2, 4, "happy")

## Lists can be stored within lists
##Make a list within a list. Click on it in the global environment. 
list2 <- list(list1, "thing 1", 1:2)

class(list2)
str(list2)

#Access a value in the nested list with its index using brakets

## "Subsetting a list works in the same way as subsetting an atomic vector. 
## Using [ will always return a list; [[ and $, as described below, 
## let you pull out the components of the list."
## http://adv-r.had.co.nz/Subsetting.html


## pull out a component use double brackets
list2[[2]]

## pull out a list using single brackets
list2[2]

## What is the class of each of these outputs?

class(list2[[2]])
class(list2[2])

## What do you use if you wanted to pull out element 2 and 3 from list2?
# [ or [[ ?

list2[2:3]

# “If list x is a train carrying objects, then x[[5]] is the object in car 5; 
# x[4:6] is a train of cars 4-6.”
# http://adv-r.had.co.nz/Subsetting.html#data-types

# Return the third component of the first list 
# stored within list2

list2[[1]][[3]]

#Make a named list
list3 <- list("num1" = 123, "num2" = 1, "num3" = 34)

##Access part of a list by its name
list3$num1

#Q: What is the difference between a vector and a list? 
#  A: 1) A vector only holds one data type whereas a list can hold multiple data types.

#  What is similar?
#     1) Both are one dimensional, but a list can have embedded lists, so can be considered multi-dimensional (but at each level it is only one dimensional). 
#  Graphic here shows the differences and similarities 
# http://adv-r.had.co.nz/Data-structures.html#data-frames

## 


#Q: What is the structure of a dataframe? 
#  A: 1) It's like a list of named vectors of the same length
#     2) It's like a matrix because it is two dimensional

# Make a vector called "name" that stores the names of your family members. 

name <- c("Darrell", "Amy", "Elisa","Lydia","Emmy")

# Make a vector called "age" that stores the ages of those family members in the same order. 

age <- c(42, 42, 15, 13, 11)

#Make a dataframe called "family" that stores these two columns. Print it out. 

family <- data.frame(name, age)
family

## you can also define the vectors within a dataframe function in one step

num_letter <- data.frame(numbers = 1:4, letters=c('a','b','c','d'))
num_letter

## each column can be a different data type

str(family)

## you can subset it like a list using the columns names
## print the names

family["name"]
family[["name"]]

## another way is to use the $
family$name

class(family["name"])
class(family[["name"]])

## It is two-dimensional, and you can subset it like a matrix 
## data.frames and matrices are Roman Catholic
## data.frame[rows, cols]
## row/cols (you can't do that with lists)

## Return the age from the third oldest person listed in the family using matrix notation

family[3,2]

## Now get it out using the column names
family$age[3]

third_age <- family$age[3]

## return the age of the third and fourth members
## using matrix notation
family[c(3:4),2]

# using $ notation
family$age[3:4]

# print out all the values of the ages of all the family
# using matrix notation

family[c(1:5),2]

## Another option is to keep the rows blank
family[,2]

## or use the $

family$age

# Find the mean of the ages of your family

mean(family$age)

## sort my family youngest to oldest, and print that
order(family$age)

family[order(family$age),]

?order

# Dataframe
#Mtcars is a dataframe that is always loaded into R. Run the code below to see it. 
mtcars

## these functions tell you information about the data frame

str(mtcars)

colnames(mtcars)
rownames(mtcars)
dim(mtcars)

## We can use $ to add a new column
# gallons per mile = 1/(miles per gallon)

mtcars$gpm = 1/(mtcars$mpg)

mtcars
data(mtcars)
