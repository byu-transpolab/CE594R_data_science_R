### Look at different data.types beyond values and vectors

## lists

#Make list1, combine numbers and strings



## Lists can be stored within lists
##Make a list within a list. Click on it in the global environment. 



## Use the str() function to look at the structure of list2

#Access a value in the nested list with its index using brakets

## "Subsetting a list works in the same way as subsetting an atomic vector. 
## Using [ will always return a list; [[ and $, as described below, 
## let you pull out the components of the list."
## http://adv-r.had.co.nz/Subsetting.html


## print the second component of list2 using double brackets


## print the second component of list2 using single brackets


## What is the class of each of these outputs?



## What do you use if you wanted to pull out component 2 and 3 from list2 together?
# [ or [[ ?



# “If list x is a train carrying objects, then x[[5]] is the object in car 5; 
# x[4:6] is a train of cars 4-6.”
# http://adv-r.had.co.nz/Subsetting.html#data-types

# Return the third component of the list stored as the first component of list2


#Make a named list




##Access part of a list by its name, using $



#Q: What is the difference between a vector and a list? 
#  A: 1) A vector only holds one data type whereas a list can hold multiple data types.

#  What is similar?
#     1) Both are one dimensional, but a list can have embedded lists, so can be considered multi-dimensional (but at each level it is only one dimensional). 
#  Graphic here shows the differences and similarities 
# http://adv-r.had.co.nz/Data-structures.html#data-frames

## Dataframes

#Q: What is the structure of a dataframe? 
#  A: 1) It's like a list of named vectors of the same length
#     2) It's like a matrix because it is two dimensional

# Make a vector called "name" that stores the names of your family members. 


# Make a vector called "age" that stores the ages of those family members in the same order. 


#Make a dataframe called "family" that stores these two columns. Print it out. 
# Use the function data.frame()




## you can also define the vectors within a dataframe function in one step
## create a data.frame of numbers and letters




## each column can be a different data type
## Look at the structure of the names dataframe


## you can subset it like a list using the columns names
## Use the brackets to return just the names
## Try both single and double brackets




## What is the character of the subset when using single or double brackets?


## Then print the names using the $




## It is two-dimensional, and you can subset it like a matrix 
## Remember! data.frames and matrices are "Row"man "C"atholic
## data.frame[rows, cols]
## row/cols (you can't do that with lists)

## Return the age from the third oldest person listed in the family using matrix notation




## Now get it out using the column names




## return the age of the third and fourth members
## using matrix notation



# using $



# print out all the values of the ages of all the family
# using matrix notation



## Another option is to keep the rows blank



## or use the $




# Find the mean of the ages of your family



## sort your names from youngest to oldest, and print it


?order

# Dataframe
#Mtcars is a dataframe that is always loaded into R. Run the code below to see it. 
mtcars

## these functions tell you information about the data frame

str(mtcars)
colnames(mtcars)
rownames(mtcars)
dim(mtcars)

## We can use the notation we learned to add a new column
# gallons per mile = 1/(miles per gallon)

# using matrix


# using $


View(mtcars)

# this function re-loads the data
data(mtcars)
