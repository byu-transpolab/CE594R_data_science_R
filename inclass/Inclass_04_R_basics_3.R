###
# More R basics
# Directories, reading and writing files into and out of R
# Manipulating data.frames
##

#########
# working directories
#########

# "default location where R will look for files you want to load, 
# and will put any files you save" (Intro2r)

# R displays your working directory on top of the Console

# Good reference for working directories here: 
# https://intro2r.com/work-d.html

## you can also get your working directory using the getwd() function

getwd()

# Note that if you don't set your working directory, R keeps your
# working directory as the folder where your .Rproj file is stored

## You can change your working directory using the setwd command

setwd()

## copy the inclass exercises directory within your class github repository

## put the directory address in quotes in the setwd()
## Note you need to use double back slashes '\\' or a single forward slash '/'




#######
## R projects
#######


# On the first day, you created an R project within your github folder

# Follow the steps here to save an new R project within your inclass exercises
# Use an existing directory:

# https://intro2r.com/rsprojs.html

# Switch between the two projects and see what happens
# Does the working directory change?

# Q: What is stored in a R project?
# A: 1) Working directory
#    2) Workspace/Environment
#    3) History (Remembers which files were last open)

## switch back to your original R project


#######
# importing data
#######

## download the crash2019.csv data from InClass4.R basics R in learning suite
## save it to your /data folder within your CE594R repository

# Assign the file to a dataframe called crash2019 using the function read.csv()
## If the file is stored in the working directory, we could just pass the file name

## try reading in crash2019.csv using the read.csv() function


## Note you need to use double back slashes '\\' or a single forward slash '/'
## read in crash2019 data using the full path using read.csv



### Next we will use the relative path. 
## ./ refers to a folder below the working directory
## ../ refers to a sister folder up one level from the working directory

## Read in the data using the relative path



## these functions tell you information about the data frame

str(crash2019)
colnames(crash2019)
rownames(crash2019)
dim(crash)
head(crash2019)


#Q: Where else can you go to quickly see the structure of the data? 
# A: Click the blue arrow on your global environment. 

## look at a quick summary of the dataset

summary(crash2019_2)

## make a subset of crash2019 with missing MILEPOINT information
## using matrix notation and the is.na() function


## note two observations are missing info
## 168710
## 116916

## assign a new data.frame as crash2019_2 that does not include these two rows 




## 

# Q: Has the WORK_ZONE_RELATED variable imported correctly? What should be its data type? 


## update it using the as.logical() function


## note there are other functions to change the class of variables, including: 
## as.numeric(), as.character(), as.integer()

### now export your updated dataset called crash2019_2
## put it in the data folder
?write.csv



#### 
# Packages
####

## install libraries using the install.packages() function
## You need to do this once 
# install.packages('name of package)
# install.packages('tidyverse)

## then you load a package using the library() command



## now use the read_csv() function to read in the crash2019 data
## similar, but not the same as read.csv function



# Notice, since we are using the same name as we did when we read this in with read_csv the last time, this will overwrite that dataset. 

## look 

str(crash2019)

## Are the same observations missing? Look at rows 116916,168710



# Q: How did read_csv treat the two rows with incorrectly formatted data?
# A: read_csv is smarter than read.csv
# it treated the data with incorrect data as missing--we don't need to remove them

#Q: Look at the first line of the summary?. What is different about this output? What is the same? 
#  A: The whole dataset is a different class, spec_tbl_df is called a tibble, which is like f data.frame. 
# This matters very little to us for this class. All of the same functions will work for data.frames and tibbles. It also tells us the rows and columns. 

#Q: Look at the CRASH_DATETIME column. How has it read in this time? 
#  A: It has read in as a POSIXct column. This means R recognizes it as a date. 

#Q: Has the WORK_ZONE_RELATED column read in correctly this time? 
#

#Q: How has it read in strings? How is this different from factors? 
#  A: Strings have been read in as character, which does not group them into levels. 

#Q: Does this output include levels? Why? 


#Q: How has it read in the CRASH_ID column? Is this the right format? 


## We can change CRASH_SEVERITY_ID to a factor. 
## A factor is useful when you want the character values have a certain order
# or used to group data
## This is especially useful in plotting, and statistical models

# Change the CRASH_SEVERITY_ID to a factor
## use the factor() function



## What is the class of crash_severity? Is it a character or a factor?
## use class() function



#########
## reading in excel files
########

## install and load the package readxl 
## install.packages(''), library()

library(readxl)

## read in the first tab of following excel file 
## "ozone Data_corrected.xlsx" 
## it is saved in the /data folder of the public class repository
## CE594R_data_science_R\\data\\Ozone Data_corrected.xlsx

## Rather than moving it to my other repository, I can grab it from the public repository
## I can move up a directory using the ..\\

# Read in the first sheet 

?read_excel


## Assign a subset of the studyozone to studyozone 2, 
## the following six columns ("House.Number","Visit","Location","Conc (mg/m3)","ppm","LOD ppm")
## and remove the House.Number == 'BLANK'

View(studyozone_2)

## Add a new column called O3.ppb that converts ppm to a numeric value, and converts the values to ppb






