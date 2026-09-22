#------------------------------------#
# MB5370: Techniques in Marine Science 1
# Programming Fundamentals
# Kylar Duffy
# 15/09/2026
#------------------------------------#

# Workshop 01. Introduction ####
# R syntax and working in scripts ####
# This section introduces us to R by running simple calculations inside a script.
2 + 1
1:30
1:100
6 * 2

# Functions and Arguments ####
# This section shows the built-in functions in programming languages.
years_old <- 25.7
round(years_old) # rounds up
floor(years_old) # rounds down
years_old <- 25.765
 round(years_old, 2) # comma after the object to specify argument
?round # go to help, args(round) in the Console

# Objects and Assignment ####
# This section focuses on understanding how data is stored in R and why that matters.
# Saving a single value
coral_count <- 42
# Saving a vector of multiple fish lengths (in mm)
fish_lengths <- c(124, 152, 98, 221, 146)
# Option and - key is shortcut for <-
coral_count + 1
coral_count + coral_count
# Cases matter
Coral_Count <- 1
coral_count + Coral_Count
# 01_age <- 25 # object name cannot start with a number
# !_age <- 25 # object name cannot have special symbols
# coral count <- 25 # object name cannot have spaces
# `coral count` <- 25 #spacwes can be used with back ticks
# Debug code
# Field survey data
quadrat_area_m2 <- 0.25
number_of_quadrats <- 16
total_area_surveyed <- quadrat_area_m2 * number_of_quadrats
# Let's print out the result
# print(total_area_surveyd)
print(total_area_surveyed)

# Packages ####
# This section introduces packages, packages are a collection of functions that 
# can be downloaded and used by you.
# Installing and loading packages > tidyverse
# install.packages("tidyverse") # download and install, put this into console to stop repeated installs
library(tidyverse) # load into current session

# Data Types ####
# R categorises data to know what mathematical operations or transformations are permitted.
# The four types are Numeric (continuous decimals), Integer (whole numbers), Character (text enclosed in quotation marks), Logical (true or false.

# Checking Structures
# Assign variable values
site_name <- "Heron_Island"
transect_depth_m <- 12.5
bleaching_present <- TRUE
# Check using function class()
class(site_name)
class(transect_depth_m)
class(bleaching_present)
# Check using function str()
str(site_name)
str(transect_depth_m)
str(bleaching_present)
# Function class() & str() give us same result in different ways, skill is to know when to use.

# Rounding Numbers
# Tracking the age of an old-growth Porites coral colony
years_old <- 25.765
# Clean this up for our summary report
round(years_old, 2)
# Manipulating outputs
# Make variables
years_old <- 25.765
rounded_age <- round(years_old, 2)
# Combine text and data variables
paste("Average colony age is", rounded_age, "years old")
years_old <- 25.765
rounded_age <- round(years_old, 1)
paste("Average colony age is", rounded_age, "years old")

# Data Structures ####
# Elements of data types can be combined to form a data structure. Elements are like what you put in a single cell (excel), whole spreadshet as the data structure.
# Many data structures include: atomic vector, list, matrix, data frame, factors
# vector is most common, a collection of elements that are most commonly character, numeric, integer, logical
fish_lengths <- c(124, 152, 98, 221, 146) # already have a vector with numeric elements
coral_spp <- c("Porites", "Acropora", "Montastrea") # vector with full character elements
# all elements inside a vector must be the same type
class(fish_lengths)
class(coral_spp)
# values inside lists can be several different types
notes <- list("Acropora", 27.5, TRUE)
notes
notes[[1]] # can retrieve individual elements using double square brackets in lists and vectors

# Data frames and tibbles ####
# R can also handle two-dimensional data files like spreadsheets referred to as data frames, each column must be the same type in each cell
# you can import a data frame from an external file .csv or .xlsx or can build it from the ground up, data.frame function lets you make them
my_dataframe <- data.frame(no <- c(1,2,3), c("Plectropomus", "Scarus", "Pomacentrus"), 
                           c(TRUE, FALSE, TRUE))
my_dataframe
str(my_dataframe) # R has guessed the type of each variable, make sure to check and change if necessary
my_dataframe$no <- as.factor(my_dataframe$no)
str(my_dataframe)
# 3 each vector must be the same length, you can use NA if you need something in an empty space
# na.omit (remove rows with NAs) or is.na (checks if a value is not available)

# R Projects (.Rproj) ####
# acts as an anchor whne you open an .Rproj file to use safe relative file paths which will work on any computer
# File > New File > Quarto Document, HTML, save into docs, click render



