###
# More R basics
##

#########
# working directories
#########

# "default location where R will look for files you want to load, 
# and will put any files you save" (Intro2r)

# R stores your working directory on top of the Console

# Good reference for working directories here: 
# https://intro2r.com/work-d.html

getwd()

# Note that if you don't set your working directory, R keeps your
# working directory as the folder where your .Rproj file is stored


## You can change your working directory using the setwd command

setwd()

## copy the inclass exercises directory within your class github repository

## put the directory address in quotes in the setwd()

## ## Note you need to use double back slashes '\\' or a single forward slash '/'

setwd('C:\\Users\\Sonntag\\Github\\CE594R_sonntag\\inclass')


#######
## R projects
#######


# On the first day, you started an R project within your github folder

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
## 

setwd('C:\\Users\\Sonntag\\Github\\CE594R_sonntag')

#######
# importing data
#######

## download the crash2019.csv data from InClass4.R basics R in learning suite
## save it to your /data folder within your CE594R repository

# Assign the file to a dataframe called crash2019 using the function read.csv()

## If the file is stored in the working directory, we could just pass the file name

crash2019 <- read.csv("crash2019.csv")

## if not, we can provide the full path path

## Here's the location of my privaterepository: 

## C:\\Users\\Sonntag\\Github\\CE594R_sonntag\\data

## Note you need to use double back slashes '\\' or a single forward slash '/'
## read in crash2019 data using the full path

crash2019 <- read.csv("C:\\Users\\Sonntag\\Github\\CE594R_sonntag\\data\\crash2019.csv")

### Next we will use the relative path. 
## ./ refers to a folder below the working directory
## ../ refers to a sister folder up one level from the working directory
## ..//..// moves you up two directories

## Read in the data using the relative path
crash2019 <- read.csv("./data/crash2019.csv")

## these functions tell you information about the data frame

str(crash2019)
colnames(crash2019)
rownames(crash2019)
dim(crash)
head(crash2019)

## make a subset of crash2019 with missing MILEPOINT information

crash2019_nomile <- crash2019[is.na(crash2019$MILEPOINT),]

## note two observations are missing info
## 168710
## note 116916

## remove these two rows from the main dataset
crash2019_missing <- crash2019[c(116916,168710),]
crash2019_2 <- crash2019[-c(116916,168710),]

str(crash2019_2)

#Q: Where else can you go to quickly see the structure of the data? 
# A: Click the blue arrow on your global environment. 

## look at a quick summary of the dataset

summary(crash2019_2)

## 

# Q: Has the WORK_ZONE_RELATED variable imported correctly? What should be its data type? 
#  A: No. It should be a logical variable. 

## update it using the as.logical() function


crash2019_2$WORK_ZONE_RELATED  <- as.logical(crash2019$WORK_ZONE_RELATED)
crash2019_2$PEDESTRIAN_INVOLVED <- as.logical(crash2019_2$PEDESTRIAN_INVOLVED)

## note there are other functions to change the class of variables, including: 
## as.numeric(), as.character(), as.integer()

### now export your updated dataset called crash2019_2
## put it in the data folder
?write.csv

write.csv(crash2019_2,"./data/crash2019_2.csv",row.names = F)


#### 
# Packages
####

## install libraries using the install.packages() function
## You need to do this once 
# install.packages('name of package)
# install.packages('tidyverse)

## then you load a package using the library() command

library(tidyverse)

## now use the read_csv() function to read in the crash2019 data
## similar, but not the same as read.csv function

crash2019 <- read_csv("./data/crash2019.csv")

# Notice, since we are using the same name as we did when we read this in with read_csv the last time, this will overwrite that dataset. 

str(crash2019)

crash2019_missing <- crash2019[c(116916,168710),]
crash2019_missing

summary(crash2019)

# How did read_csv treat the two rows with incorrectly formated data?

# A: read_csv is smarter than read.csv
# it treated the data with incorrect data as missing--we don't need to remove them

#Q: Look at the first line of this function. What is different about this output? What is the same? 
#  A: The whole dataset is a different class, spec_tbl_df instead of data.frame. 
# This matters very little to us for this class. All of the same functions will work for data.frames and tibbles. It also tells us the rows and columns. 

#Q: Look at the CRASH_DATETIME column. How has it read in this time? 
#  A: It has read in as a POSIXct column. This means R recognizes it as a date. 

#Q: Has the WORK_ZONE_RELATED column read in correctly this time? 
#  A: Yes it is a logical column. 

#Q: How has it read in strings? How is this different from factors? 
#  A: Strings have been read in as character, which does not group them into levels. 

#Q: Does this output include levels? Why? 
#  A: No it doesn't because these have not read in as factors. 

#Q: How has it read in the CRASH_ID column? Is this the right format? 
#A: It has read it in as a numeric variable. This is not correct because it doesn't stand for real values. 

## We can change CRASH_SEVERITY_ID to a factor. 
## A factor is useful when you want the character values have a certain order
# or used to group data
## This is especially useful in plotting, and statistical models

# Change the CRASH_SEVERITY_ID to a factor
## use the factor() function

crash2019$CRASH_SEVERITY_ID <-factor(crash2019$CRASH_SEVERITY_ID, 
         levels = c(1:5),ordered = TRUE)

## What is the class of crash_severity? Is it a character or a factor?

class(crash2019$CRASH_SEVERITY_ID)

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

studyozone<- read_excel("..\\CE594R_data_science_R\\data\\Ozone Data_corrected.xlsx", sheet='Data') 

## Assign a subset of the studyozone to studyozone 2, 
## the following six columns ("House.Number","Visit","Location","Conc (mg/m3)","ppm","LOD ppm")
## and remove the House.Number == 'BLANK'

View(studyozone_2)

studyozone_2 <- studyozone[studyozone$House.Number !='BLANK',c("House.Number","Visit","Location","Conc (mg/m3)","ppm","LOD ppm")]

studyozone_2 <- studyozone[!(studyozone$House.Number =='BLANK'),c("House.Number","Visit","Location","Conc (mg/m3)","ppm","LOD ppm")]


## look at the structure
str(studyozone_2)

## Add a new column called O3.ppb that converts ppm to ppb, and converts it to to a numeric value
studyozone_2$O3.ppb <- as.numeric(studyozone_2$ppm)*1000

## What happened to the O3.ppb values where the ppm values contained text such as "<0.006"?

View(studyozone_2)

## They were replaced with NA



