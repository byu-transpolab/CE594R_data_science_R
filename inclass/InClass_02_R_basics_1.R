## Instructions

## Save this in your github repository 'inclass' folder as baseR_1_finisher.R
## Follow the instructions in the comments below to add content to the r script
## Commit and push your changes to github repository
## Create an issue in your github repository, 
## and use the @darrell_sonntag to flag to let me know you have completed your first inclass assignment
## Submit the link to your github repository in learning suite (to get credit for doing it)


### This is an R script

# the hashtag signal tells R this is not code

#Copy and paste the following code lines into the console 
## use R as an calculator

3+3

#What's the average amount of days in a month?


#How many days in 3 years?



## What's the volume of a cube with a side of length 5 meters?
## (use exponents)



## Now, let's run R from the script


#Put the cursor next to the line
## 
## Ctrl+Enter
## Or select the Run button at the top of the script

3+3

## Now let's create some objects
## you create it using the assignment operator 
## assign 3 to my_number


## notice you can see my_number in the Environment tab
## use the print function() to view it


## we can do math our our number
## What's 3*my_number?


## make a new object that is 3* my_number
## call it my_number2


## you can remove objects from your environment
## use the rm() function


## you can also store characters
## create my_word

## note, you can either use single of double quotes
## try it



## but you can't do math with it
## what happens when you try to multiply my_word by 3?


## Vectors

## the c() function stands for concatenate, and joins values together into a vector

## make my_vec with a bunch of numbers



## we can look at the class of the vector
## using the function class()

## we can do math on vectors!
# multiply my_vec by four, and add 2 to all the values
# what happens?


## we can also add vectors together
# add my_vec to my_vec 2



## you can also make a vector of words


## what's the class of my word vector?


## What happens if you try to combine numbers with characters? 



##########

## functions for creating number vectors
## create an object with numbers from 1 to 20 using the :


## create a sequence from 2 to 20, counting by two
## use the seq function

?seq


## replicate 2 20 times
?rep

## Make a vector which counts from 1:10, then counts by 5, from 15 to 100, and then ends
# with one hundred 1's. 
# call it my_vec_long


## Question
## make a vector that counts 1:10, ten times



## Index and subscripting 

## just grab the 1st value from my_words

## Or I can add a new ski resort to my vector, by using the c() function


## Print the first ski resort
## Note: This is why R is better than Python, is starts the index at 1 (not 0!?)
## 

ski[1]

## Assign the first ski resort to another object called 'best'



## I can grab the 1, 3 value


## grab the 3,1 values




## grab the 2:4 values



## I can change the value





### Logical Indexing

## report all the values from my_vec_long that are greater than 10


## how does this work?
## look at the logical output


## report out every other observation in my_vec_long



## print all the items from my_vec_long that are equal to 1



## print all items from my_vec_long that are between 5 and 10




## sort the vector largest to smallest


### Missing data

my_data <- c(5.6,9,3.4,5,NA,4,2.3,12,NA)


## What's the class of my_data?


## calculate the mean
## use the function mean()

## what do you get?


## how to you get it to ignore the NA?
?mean


#You have this data
my_data_2 <- c(5.6,9,3.4,5,'NULL',4,2.3,12,'NULL')

## Calculate the mean of this my_data_2



## What's the class of my_data_2?



## Use what you have learned with filter, to replace the 'NULL' values with NA values



## Then use the as.numeric() function to convert the my_data_2 to a numerical vector


## then calculate the mean




## Extra info
# Overview of data types in R

# https://intro2r.com/data-types.html#


## help on functions

##
help("mean")
?mean
?mean()


