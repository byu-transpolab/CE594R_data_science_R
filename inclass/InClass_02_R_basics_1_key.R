
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

my_number <- 3

## notice you can see my_number in the Environment tab

print(my_number)

my_number

## we can do math our our number
## What's 3*my_number?


## make a new object that is 3* my_number

my_number2 

## you can remove objects from your environment
rm(my_number)

## you can also store characters

my_word <- "jolly"

print(my_word)

## note, you can either use single of double quotes
my_word <- 'jolly'

print(my_word)

## but you can't do math with it
## what happens when you try to multiply my_word by 3?

my_word*3


## Vectors

## the c() function stands for concatenate, and joins values together into a vector

## make my_vec with a bunch of numbers

my_vec <- c(1,2,3,4,5)

print(my_vec)

## we can look at the class of the vector

class(my_vec)


## we can do math on vectors!
# multiply my_vec by four, and add 2 to all the values
# what happens?

my_vec2 <- my_vec*4+2
my_vec2

## we can also add vectors together
# add my_vec to my_vec 2

my_vec+my_vec2

## you can also make a vector of words

my_words <- c("Alta","Snowbird","Sundance","Snowbasin")

## what's the class of my_words?
class(my_words)

## What happens if you try to combine numbers with characters? 

mixed_vector <- c(1,"Alta")

class(mixed_vector)


##########

## functions for creating number vectors

my_count <- 1:20
my_count

## create a sequence
## use the seq function

?seq
my_seq <- seq(2,20,by=2)
my_seq

## replicate

my_rep <- rep(2,20)

## Make a vector which counts from 1:10, then counts by 5, from 15 to 100, and then ends
# with one hundred 1's. 

my_vec_long <- c(1:10,seq(15,100,by=5),rep(1,100))
my_vec_long

## Question
## make a vector that counts 1:10, ten times

rep(1:10,10)

## Index and subscripting 

## just grab the 1st value from my_words

## Or I can add a new ski resort to my vector, by using the c() function

ski <- c(my_words,'Nordic Valley')

ski


## Note: This is why R is better than Python, is starts the index at 1 (not 0!?)
## 

ski[1]

## You can assign it value
highest <- ski[1]
highest

## I can grab the 1, 3 value

ski[c(1,3)]

## grab the 3,1 values

ski[c(3,1)]


## grab the 2:4 values

ski[2:4]


## I can change the value

ski[1] <- 'Park City'

ski

### Logical Indexing

my_vec_long[my_vec_long>10]

## how does this work?

my_vec_long>10

logic_vector <- my_vec_long>10

my_vec_long[logic_vector]


my_vec_long[rep(c(TRUE,FALSE),64)]

my_vec_long[c(TRUE,FALSE)]

## grab all the items from my_vec_long that are equal to 1

my_vec_long[my_vec_long ==1]

## grab all items from my_vec_long that are between 5 and 10

my_vec_long[my_vec_long >5 & my_vec_long<11]


## sort the vector largest to smallest

sort(my_vec_long)

### Missing data

my_data <- c(5.6,9,3.4,5,NA,4,2.3,12,NA)
my_data
class(my_data)

## calculate the mean

mean(my_data)

## what do you get?

?mean

## how to you get it to ignore the NA?
mean(my_data,na.rm=T)


###

#You have this data
my_data_2 <- c(5.6,9,3.4,5,'NULL',4,2.3,12,'NULL')

mean(my_data_2,na.rm=T)

class(my_data_2)

## Use what you have learned with filter, to replace the 'NULL' values with NA values

my_data_2[my_data_2=='NULL'] <- NA

## Then us the as.numeric() function to convert the my_data_2 to a numerical vector

my_data_2 <- as.numeric(my_data_2)

mean(my_data_2,na.rm=T)

## Overview of data types in R

# https://intro2r.com/data-types.html#


## Functions

##
help("mean")
?mean
?mean()

plot(1:5,11:15)
