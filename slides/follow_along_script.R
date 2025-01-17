# This script will help you to actively follow the slides and perform the exercises

###############################################################################
############# MONDAY MORNING -- Introduction ################################## 
###############################################################################

### Using R as a simple calculator ###
a = 1 
b = 2
c = a + b

c

# can use = or "<-"
c <- a + b 

c

# example "objects"
data = c(1,13,2,1,43,53,1,2,34,54,2,4,6,23)

cutoff = 10 

data[data>cutoff]

### Introduction to using a function ###

sum(1, 2)

sum(1, b)

?sum()

### Introduction to vectors ###

c(1,2,3)

c(a, b)

a_vector = c(1.23, 2.34, 6.21, 3.11, 3.412, 4.32, 5.922, 5.65)

a_vector[4]

### Introduction to array/vector ###

matrix(data = c(1,2,3,4,5,6,7,8), nrow = 4 )

a_matrix = matrix(data = c(1,2,3,4,5,6,7,8), nrow = 4 )

a_matrix[3,2] # first row, then column

###############################################################################
################################ Exercise 1: ################################## 
###############################################################################

a_vector = c(1.23, 2.34, 6.21, 3.11, 3.412, 4.32, 5.922, 5.65)

# calculate the mean of a_vector 


# calculate the standard deviation of a_vector


# calculate the maximal value of a_vector


# calculate the minimal value of a_vector


# calculate the Length of the vector

###############################################################################
################################ Exercise 2: ################################## 
###############################################################################

#Can you figure out what you can do with the following functions?

#seq()

#rep() 

### Introduction to classes ###

class(a_vector)

b_vector = c("something", "something else", "another thing", "completely differnt")

class(b_vector)

c_vector = c(F, T, T, T, F, T, F, T)

class(c_vector)

gender <- factor(c("Male", "Female", "Female", "Male"))

class(gender)

my_list <- list(name = "Alice", age = 25, scores = c(90, 85, 88))

print(my_list)

### Introduction to dataframes ###

# Create a data frame
df <- data.frame(x = 1:3, y = c("a", "b", "c"))

# Printing
print(df)

cars

# Create a tibble
library(tibble)
tb <- tibble(x = 1:3, y = c("a", "b", "c"))

print(tb)

### Introduction to simple plots 

plot(cars$speed, cars$dist)

hist(cars$speed)

###############################################################################
################################ Exercise 3: ################################## 
###############################################################################

iris

# create a point plot for the sepal length against the sepal width of the iris data

# color the points red

# change x and y labeling

# add a title

# change the type of points

### Packages 

#install.packages("tidyverse")
library(tidyverse)

help(package = "tidyverse")

###############################################################################
################################ Exercise 4: ################################## 
###############################################################################

# Install the package ???pacman???

# open the help page for ???pacman???

###############################################################################
########### MONDAY AFTERNOON -- Analysis cookbook ############################# 
###############################################################################

getwd() 

setwd("/Users/jb22m516/Documents/GitHub/getting_started_with_R/") # replace this with your path!

# Set the project root directory
d_proj <- "/Users/jb22m516/Documents/GitHub/getting_started_with_R/exercises/" # replace this with your path!

# Basic folders
# Directory for original data
d_oridata <- file.path(d_proj, "01_oridata")
# Directory for edited data
d_data <- file.path(d_proj, "02_data")
# Directory for R scripts
d_code <- file.path(d_proj, "03_code")
# Directory for R output
d_output <- file.path(d_proj, "04_output")


## This code below creates the folders in case you haven't set them up yet
# Create a vector with all directories
dirs <- c(d_oridata, d_data, d_code, d_output)

# Loop through the directories and create them if they don't exist
for (dir in dirs) {
  if (!dir.exists(dir)) {
    dir.create(dir, recursive = TRUE)
  }
}

library(readxl)

### Load in data 

nhanes <- read_excel( file.path(d_proj, "/01_oridata/nhanes_for_R.xlsx") ) 

# Options for read_excel()

# sheet: Specify the sheet name or number.
nhanes <- read_excel(file.path(d_data, "nhanes_for_R.xlsx"), sheet = 1)

# range: Import a specific range of cells.
nhanes <- read_excel(file.path(d_data, "nhanes_for_R.xlsx"), range = "A1:D100")

# col_names: Specify if the first row contains column names.
# TRUE (default): First row is used as column names.
# FALSE: R assigns default column names (X1, X2, etc.).
nhanes <- read_excel(file.path(d_data, "nhanes_for_R.xlsx"), col_names = FALSE)

# skip: Skip the first n rows
nhanes <- read_excel(file.path(d_data, "nhanes_for_R.xlsx"), skip = 3)

# na: Define missing values.
nhanes <- read_excel(file.path(d_data, "nhanes_for_R.xlsx"), na = c("NA", "99"))

###############################################################################
################################ Exercise 5: ################################## 
###############################################################################

# Download the data ???BMX_J.xpt??? from GitHub and put it into your ???01_oridata??? 
# folder. This is the original data file from the NHANES dataset that contains 
# all body measures (e.g., height, weight).

#Find out which package you need to import an xpt-file.

#Import the file in R and assign it to the object ???nhanes_body???.

### Inspecting the data

# Dimensions (rows and columns)
dim(nhanes)

# Number of rows only
nrow(nhanes)

# Number of columns only
ncol(nhanes)

# colnames 
colnames(nhanes)


### overview of dataset structure

# option 1
str(nhanes)

# option 2
glimpse(nhanes)

# summary statistics per column
summary(nhanes)

# view the data
# first 6 rows
head(nhanes)

# last 6 rows
tail(nhanes)

# You can append this argument to specify the first/last number of rows you want to see:
head(nhanes, n = 10)

# Class of the entire dataset
class(nhanes)

# Class of a specific column
class(nhanes$RIAGENDR)

# Data types of all columns
sapply(nhanes, class)

###############################################################################
################################ Exercise 6: ################################## 
###############################################################################

# Download the data Covid19_vaccines_Basel. This dataset contains information 
# about the number of Covid-19 vaccinations in the Canton Basel-Citiy between 
# 2 January 2021 and July 1 2023.

# Import the excel file Covid_19_vaccines_Basel.xlsx into R and assign it to the object ???covid???.

# How many columns does the dataset have?

# How many rows?
  
# Get an overview/summary of your data.

# What is the median number of vaccinations per day? (variable Vac_perday)

# How many missing values do we have for booster vaccinations? (variable Total_vacbooster)

# What is the total number of vaccinations in row 14? (variable Total_vac)


#### Inspecting missing values 

# Total missing values
sum(is.na(nhanes))

# Missing values per column
colSums(is.na(nhanes))

# Missing values for a specific variable
sum(is.na(nhanes$BMXWT))

###############################################################################
################################ Exercise 7: ################################## 
###############################################################################

# Check the number of missing values for all variables in the covid dataset.

# Check missings only for total vaccine boosters (variable Total_vacbooster).

### THE TIDYVERSE
library(tidyverse)

### calculate mean weight of all males

mean(nhanes$BMXWT[nhanes$RIAGENDR == 1], na.rm = TRUE)

nhanes %>%
  filter(RIAGENDR == 1) %>%
  summarize(mean_weight = mean(BMXWT, na.rm = TRUE))

### select()

# Select specific columns
df <- nhanes %>%
  select(SEQN, RIAGENDR, RIDAGEYR, BMXWT, BMXHT)

# Check rows and columns
dim(df)

# Preview dataset
head(df)

# Reorder columns
dt<- nhanes %>%
  select(RIDAGEYR, BMXWT, BMXHT, SEQN, RIAGENDR) %>%
  head %>%
  print

# Select columns by position
dn <- nhanes %>%
  select(1:3) %>%
  head %>%
  print

# Select consecutive columns using names - same result as above
dn <- nhanes %>%
  select(SEQN:RIDAGEYR)
head(dn)

# Exclude specific columns
dn <- nhanes %>%
  select(-SEQN:-INDHHIN2)

head(dn)

# Select columns that start with "BMX"
dn <- nhanes %>%
  select(starts_with("BMX"))
head(dn)

# Select columns that contain "AGE"
dn <- nhanes %>%
  select(contains("AGE"))
head(dn)

# Select columns that end with "YR"
dn <- nhanes %>%
  select(ends_with("YR"))
head(dn)

###############################################################################
################################ Exercise 8: ################################## 
###############################################################################

#When writing the code for the following exercises, assign them to the object ???ds???.

# From nhanes, select the columns SEQN, RIAGENDR, and SMQ040.

# Reorder the columns to: SMQ040, RIAGENDR, SEQN.

# Exclude the BPXSY1 and BPXDI1 columns.

# Select columns that start with BPX.

# Bring two operations (1. and 2.) together using the pipe:
  
#  a) Select only the columns SEQN, RIAGENDR, and SMQ040

#  b) Reorder the columns to: SMQ040, RIAGENDR, SEQN

### filter()

# Filter for males only (RIAGENDR == 1)
dn <- df %>%
  filter(RIAGENDR == 1)

head(dn)

# label for factor 
dn <- df %>%
  mutate(RIAGENDR = as.factor(RIAGENDR)) %>% # mutate to factor variable
  filter(RIAGENDR == "1")
head(dn)

# Filter for females aged 30 or older
dn <- df %>%
  filter(RIAGENDR == 2 & RIDAGEYR >= 30) %>%
  summary %>%
  print

# Filter for individuals younger than 18 OR with weight above 80 kg
dn <- df %>%
  filter(RIDAGEYR > 18 | BMXWT > 80)

# Filter rows where weight is not missing
dn <- df %>%
  filter(!is.na(BMXWT)) %>%
  summary %>%
  print

# Filter rows where height is missing
dn <- df %>%
  filter(is.na(BMXHT)) %>%
  summary %>%
  print

###############################################################################
################################ Exercise 9: ################################## 
###############################################################################

# From nhanes select the following variables: SEQN, RIAGENDR, SMQ040, BPXSY1, 
# BPXDI1. Assign them to the object ???ds???.

# For the following exercises, use the dataset ???ds??? and assign any operations 
# to the object ???dt???.

# Filter rows where RIAGENDR is 2 (female).

# Filter rows where BPXSY1 (systolic blood pressure) is greater than 120 and 
# BPXDI1 (diastolic blood pressure) is less than 80.

# Combine multiple conditions with |: Filter rows where RIAGENDR is 1 (male) 
# OR BPXSY1 is greater than 140.

### arrange()

# Sort by age (ascending order)
dn <- df %>%
  arrange(RIDAGEYR) %>%
  head %>%
  print

# Sort by weight (descending order)
dn <- df %>%
  arrange(desc(BMXWT))

head(dn)

# Sort by gender (ascending) and age (descending)
dn <- df %>%
  arrange(RIAGENDR, desc(RIDAGEYR))

head(dn)

# Sort by height with NA at the top
dn <- df %>%
  arrange(desc(is.na(BMXHT)))

head(dn)

###############################################################################
################################ Exercise 10: ################################# 
###############################################################################

# Use again your dataset ???ds??? and assign any operations to ???dt???:
  
# Sort the dataset by BPXSY1 (systolic blood pressure) in ascending order.

# Sort the dataset by SMQ040 (smoking status) in descending order.

# Filter rows where BPXDI1 (diastolic blood pressure) is greater than 90 and 
# sort descending by BPXSY1.

### rename()

# Rename a single variable
dn <- df %>%
  rename(gender = RIAGENDR)

# View the result
colnames(dn)

# Rename multiple variables
dn <- df %>%
  rename(
    ID = SEQN,
    gender = RIAGENDR,
    age = RIDAGEYR,
    weight = BMXWT,
    height = BMXHT
  )

# View the results
colnames(dn)

# Examples
# Option 1: Add a prefix to all variables
di <- df %>%
  rename_with(~ paste0("NHANES_", .))

# View the result
colnames(di)

# Option 2: Add a suffix "_new" to variables starting with "BMX"
di <- df %>%
  rename_with(~ paste0(., "_new"), starts_with("BMX"))

# View the updated column names
colnames(di)

# Option 3: Replace "BMX" with "body" in variable names
di <- df %>%
  rename_with(~ sub("^BMX", "body", .), starts_with("BMX"))

# View the updated column names
colnames(di)

library(labelled)

# Assigning one variable label:
var_label(dn$gender) <- "Gender of participant"
# Check the label
var_label(dn$gender)

# You can also create a list and create multiple variable labels at once and assign them to a variabel:
var_label(dn) <- list(
  ID = "Participant id",
  gender = "Gender of participant",
  age = "Age at study",
  weight = "Weight in kg",
  height = "Height in kg"
)

# Check labels
var_label(dn)

###############################################################################
################################ Exercise 11: ################################# 
###############################################################################

# Practice renaming variables using the ds-dataframe. Assign all operations to ???dt???.

# Rename BPXSY1 to systolicBP.

# Rename SMQ040 to currentSmoker and BPXDI1 to diastolicBP.

# Use rename_with() to replace BPX with pressure in all variables starting with BPX.

### mutate()

# Calculate BMI
dn <- df %>%
  mutate(BMI = BMXWT / (BMXHT / 100)^2)

# List column names
head(dn)

# Convert age to months
dn <- df %>%
  mutate(RIDAGEYR = RIDAGEYR * 12) %>%
  head %>%
  print

# Convert age to month and create a new variable
dn <- df %>%
  mutate(age_months = RIDAGEYR * 12) %>%
  relocate(age_months, .after = RIDAGEYR) %>% # this function moves one variable after another one
  head %>%
  print

# Categorize age into two categories
df <- df %>%
  mutate(age_group_binary = if_else(RIDAGEYR >= 18, "adult", "child"))
head(dn)

# Categorize age into three categories
df <- df %>%
  mutate(age_group_three =
           if_else(RIDAGEYR < 13, "child", 
                   if_else(RIDAGEYR >= 13 & RIDAGEYR < 18, "teenager", "adult")
           ))
head(df)

# Categorize BMI
df <- df %>%
  mutate(BMI = BMXWT / (BMXHT / 100)^2) %>%
  mutate(BMI_category = case_when(
    BMI < 18.5 ~ "underweight",
    BMI >= 18.5 & BMI < 25 ~ "normal",
    BMI >= 25 & BMI < 30 ~ "overweight",
    BMI >= 30 ~ "obese"
  ))

head(df, n = 20)


###############################################################################
################################ Exercise 12: ################################# 
###############################################################################

# Use again your dataset ???ds??? and assign all operations to this dataset (ds).

# Create a new variable called pulse_pressure, calculated as BPXSY1 - BPXDI1.

# Create a binary variables smoker_status using if_else():
#    3 for SMQ040 (not at all), 1 otherwise (smoking everyday / some days).

# Categorize BPXSY1 (systolic blood pressure) into three groups using case_when().
#   < 120: ???normal???

#   120-139: ???elevated???

#   > 140: ???hypertension???


### class conversions

# Example: Convert BMI (character) to a factor
df <- df %>%
  mutate(BMI_category = as.factor(BMI_category))

# Check the class of the variable
class(df$BMI_category)
levels(df$BMI_category)

df <- df %>%
  mutate(BMI_category = factor(BMI_category,
                               levels = c("underweight", "normal", "overweight", "obese")))

# Check the class of the variable
class(df$BMI_category)
levels(df$BMI_category)


# Optional: If you want to set a different reference category, you can use the relevel() function
dn <- df %>%
  mutate(BMI_category = relevel(BMI_category, ref = "normal"))
levels(dn$BMI_category)

# Example: Convert Gender (numeric) to a factor
dn <- df %>%
  mutate(RIAGENDR = as.factor(RIAGENDR))
class(dn$RIAGENDR)
levels(dn$RIAGENDR)

# Optionally, you can also assign value labels
df <- df %>%
  mutate(RIAGENDR = factor(RIAGENDR,
                           levels = c(1, 2),
                           labels = c("male", "female")))
# Check the result
class(df$RIAGENDR)
levels(df$RIAGENDR)
nlevels(df$RIAGENDR) # Gives you the number of levels

df <- df %>%
  mutate(RIAGENDR_incorrect = as.numeric(RIAGENDR))
head(df)

# Drop again
df <- df %>%
  select(- RIAGENDR_incorrect)


###############################################################################
################################ Exercise 13: ################################# 
###############################################################################

# Work again with your dataframe ???ds??? and assign all operations to the dataframe ???ds???.

# Convert smoker_status from numeric to a factor with the following labels:

#  0: ???no smoker???

#  1: ???current smoker???

# Convert the variable bp_category from string to factor variable. Order the 
# levels the following: ???normal???, ???elevated???, ???hypertension???.


### Simple descriptive statistics

# Summary function for an overview of a single variable
summary(df$RIDAGEYR, na.rm = FALSE)

# Individual calculations
min(df$RIDAGEYR, na.rm = TRUE)    # Minimum age
mean(df$RIDAGEYR, na.rm = TRUE)   # Mean age
median(df$RIDAGEYR, na.rm = TRUE) # Median age
max(df$RIDAGEYR, na.rm = TRUE)    # Maximum age

# calculate basic descriptive statistics for one variable
df %>%
  summarize(
    Min_Age = min(RIDAGEYR, na.rm = TRUE),
    Mean_Age = mean(RIDAGEYR, na.rm = TRUE),
    Median_Age = median(RIDAGEYR, na.rm = TRUE),
    Max_Age = max(RIDAGEYR, na.rm = TRUE)
  )

# calculate basic descriptive statistics for multiple variables
df %>%
  summarize(
    across(
      c(RIDAGEYR, BMXWT, BMXHT),
      list(
        Min = ~ min(.x, na.rm = TRUE),
        Mean = ~ mean(.x, na.rm = TRUE),
        Median = ~ median(.x, na.rm = TRUE),
        Max = ~ max(.x, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}"
    )
  )

# The .names argument controls how the new column names are generated:
# {.col} refers to the variable name (e.g., Variable1).
# {.fn} refers to the function name (e.g., Min, Mean, etc.).
# This ensures the output columns have clear and unique names.

library(summarytools)

# Detailed descriptive statistics for RIDAGEYR (Age)
summarytools::descr(df$RIDAGEYR)

# Frequency counts for gender
table(df$RIAGENDR)

# Proportions (relative frequencies)
prop.table(table(df$RIAGENDR))

# Frequency counts for RIAGENDR (Gender)
df %>%
  count(RIAGENDR)

# Add proportions
df %>%
  count(RIAGENDR) %>%
  mutate(Proportion = n / sum(n)) #  # calculates the proportion of each category relative to the total count of observations

freq(df$RIAGENDR)

library(table1)

# Descriptives for age, gender, BMI, and BMI category
table1(~ RIAGENDR + RIDAGEYR + BMI + BMI_category,
       data = df)

# Descriptives and omitting missings for each variable
table1(~ RIAGENDR + RIDAGEYR + BMI + BMI_category,
       data = df,
       render.missing = NULL)

# Summary of dataframe df
dfSummary(df)

# Summary of dataframe df as html-output
view(dfSummary(df))


###############################################################################
################################ Exercise 14: ################################# 
###############################################################################

# Use your dataframe ds for the following exercises.

# Calculate basic descriptive statistics (minimum, mean, median, 
# and maximum) for the following numeric variables: BPXSY1 
# (systolic blood pressure), BPXDI1 (diastolic blood pressure).

# Summarize frequencies and proportions for bp_category 
# (blood pressure category) and smoker_status.

### Visual inspection

# histograms
# Basic version
hist(df$BMI)

# Plot with some specifications
hist(
  df$BMI,
  main = "Distribution of BMI",
  xlab = "BMI",
  col = "skyblue",
  border = "white"
)

# boxplots
# Basic boxplot
boxplot(df$BMI)

# Boxplot stratified and adapted (BMI by age group)
boxplot(
  BMI ~ age_group_three,
  data = df,
  main = "BMI by Gender",
  xlab = "Age group",
  ylab = "BMI",
  col = c("lightblue", "lightgreen", "lightyellow")
)

# scatterp
# Basic scatterplot
plot(df$BMXHT, df$BMXWT)lot

# Scatterplot with some specifications
plot(
  df$BMXHT, df$BMXWT,
  main = "Scatterplot Height vs. Weight",
  xlab = "Height (cm)",
  ylab = "Weight (kg)",
  col = "darkgreen",
  pch = 19 # with this number you can specify the shape of the points
)

# barplot

# Basic bar chart
barplot(table(df$BMI_category))

# Bar chart with some specifications
barplot(table(df$BMI_category),
        main = "BMI Categories",
        xlab = "BMI Category",
        ylab = "Count",
        col = c("orange", "yellow", "red", "green")
)

###############################################################################
################################ Exercise 15: ################################# 
###############################################################################

# Create a histogram for BPXSY1 (systolic blood pressure).

# Create a boxplot for BPXSY1 (diastolic blood pressure) and 
# stratify by smoker_status. Title the figure ???Blood pressure 
# and smoker status???. Label the x-axis ???Smoking status???, 
# the y-axis ???Systolic blood pressure???. Color the boxplots in blue 
# and yellow.

# Create a scatterplot showing the relationship between BPXSY1 
# (systolic blood pressure) and BPXDI1 (diastolic blood pressure).

# Create a bar chart for bp_category (blood pressure category).

### descriptives by group 

# Grouped summaries for BMI and BMXWT by age group
df %>%
  group_by(age_group_three) %>%
  summarize(
    Mean_BMI = mean(BMI, na.rm = TRUE),
    Median_BMI = median(BMI, na.rm = TRUE),
    Mean_Weight = mean(BMXWT, na.rm = TRUE),
    Median_Weight = median(BMXWT, na.rm = TRUE),
    Count = n()
  )

# Summary table for BMI and BMXWT grouped by age_group and with testing
table1(~ BMI + BMXWT | age_group_three,
       data = df)

###############################################################################
################################ Exercise 16: ################################# 
###############################################################################

# Use tidyverse to:
# filter for participants without missings for BPXSY1

# group the dataset by bp_category

# calculate the mean and median for BPXSY1 (systolic blood pressure)

# Using table1, create a summary table for pulse_pressure stratified 
# by RIAGENDR.


### Cross-tabulations 

## baseR
# Frequency table of age_group and BMI_category
table(df$age_group_three, df$BMI_category)

# Proportion table
prop.table(table(df$age_group_three, df$BMI_category), margin = 1)
# margin = 1 gives you row-wise proportions, margin = 2 column-wise proportions

## table1
# BMI category by age group
table1(~ BMI_category | age_group_three,
       render.missing = NULL, # take this out if you also want to see the missings
       data = df)

## summarytools
# BMI category by age group
ctable(df$BMI_category, df$age_group_three, prop = "r")

# You can also drop missing, use column percentages and add a chi-square test
ctable(df$BMI_category, df$age_group_three,
       useNA = "no",
       prop = "c",
       chisq = TRUE)

###############################################################################
################################ Exercise 17: ################################# 
###############################################################################

# Using your dataset ds, 

# create a contigency table of bp_category and smoker_status. 

# Calculate column-percentages, and run a chi-square test (remember to drop missings for the chi-square test).






