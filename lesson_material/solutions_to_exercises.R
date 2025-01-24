###############################################################################
################################ Exercise 1: ################################## 
###############################################################################

a_vector = c(1.23, 2.34, 6.21, 3.11, 3.412, 4.32, 5.922, 5.65)

# calculate the mean of a_vector 
mean(a_vector)

# calculate the standard deviation of a_vector
sd(a_vector)

# calculate the maximal value of a_vector
max(a_vector)

# calculate the minimal value of a_vector
min(a_vector)

# calculate the Length of the vector
length(a_vector)

###############################################################################
################################ Exercise 2: ################################## 
###############################################################################

# seq()
seq(1,10)
seq(1,10, by = 2)

# rep()
rep(0,100)

###############################################################################
################################ Exercise 3: ################################## 
###############################################################################

#create a point plot for the sepal length against the sepal width of the iris data
plot(iris$Sepal.Length, iris$Sepal.Width, 
     type = "p", # plot points ("l" would give a line)
     col = "red", # color the points red
     xlab = "length", # change the x label
     ylab = "width", # change the y label 
     main = "Simple example plot", # add tittle
     pch = 4) # change the type of points 

###############################################################################
################################ Exercise 4: ################################## 
###############################################################################

# Install package
install.packages("pacman")

# Load package "pacman"
library(pacman)

# get help 
help(package = "pacman")

# Load all packages required for this class
pacman::p_load(tidyverse, haven, table1, readxl, writexl, labelled, summarytools) 

###############################################################################
################################ Exercise 5: ################################## 
###############################################################################

library(haven)

nhanes_body <- read_xpt(file.path(d_oridata, "BMX_J.xpt"))

# Dimensions (rows and columns)
dim(nhanes)

# Number of rows only
nrow(nhanes)

# Number of columns only
ncol(nhanes)

###############################################################################
################################ Exercise 6: ################################## 
###############################################################################

# 1. Import the excel file Covid_19_vaccines_Basel into R
covid <- read_excel(file.path(d_oridata, "Covid19_vaccines_Basel.xlsx"))

# 2. How many columns does the dataset have?
# 6 columns
dim(covid)
ncol(covid)

# 3. How many rows?
# 915 rows
dim(covid)
nrow(covid)

# 4. Use one of the functions to get an overview of your data
str(covid) # option 1
glimpse(covid) # option 2

# 5. What is the median of vaccinations per day? (variable Vac_perday)
# 72 years
summary(covid)

# 6. How many missings do we have for booster vaccinations? (variable Total_vacbooster)
# 58
summary(covid)

# 7. What is the total number of vaccinations in line 14? (variable Total_vac)
# 15,806
head(covid, n = 14)

###############################################################################
################################ Exercise 7: ################################## 
###############################################################################

# 1. Check the number of missings for the whole covid dataset.
colSums(is.na(covid))

# 2. Check missings only for total vaccine boosters (variable Total_vacbooster).
# 684
sum(is.na(covid$Total_vacbooster))

###############################################################################
################################ Exercise 8: ################################## 
###############################################################################

# 1. Select only the columns SEQN, RIAGENDR, and SMQ040.
ds <- nhanes %>%
  select(SEQN, RIAGENDR, SMQ040)

# 2. Reorder the columns to: SMQ040, RIAGENDR, SEQN.
ds <- nhanes %>%
  select(SMQ040, RIAGENDR, SEQN)

# 3. Exclude the BPXSY1 and BPXDI1 columns.
ds <- nhanes %>%
  select(-BPXSY1, -BPXDI1)

# 4. Select columns that start with "BPX".
ds <- nhanes %>%
  select(starts_with("BPX"))

# 5. Bring two operations together using the pipe
ds <- nhanes %>%
  # a) Select only the columns SEQN, RIAGENDR, and SMQ040 
  select(SEQN, RIAGENDR, SMQ040) %>%
  # b) Reorder the columns to: SMQ040, RIAGENDR, SEQN
  select(SMQ040, RIAGENDR, SEQN)

###############################################################################
################################ Exercise 9: ################################## 
###############################################################################

# 1. Select the variables SEQN, RIAGENDR, SMQ040, BPXSY1, BPXDI1
ds <- nhanes %>%
  select(SEQN, RIAGENDR, SMQ040, BPXSY1, BPXDI1)

# 2. Filter rows for people who smoke everday (SMQ040 is 1).
dt <- ds %>%
  filter(SMQ040 == 1)

# 3. Filter rows where BPXSY1 (systolic blood pressure) is greater than 120
#    and BPXDI1 (diastolic blood pressure) is less than 80.
dt <- ds %>%
  filter(BPXSY1 > 140 & BPXDI1 > 90)

# 4. Combine multiple conditions with |:
#    Filter rows where RIAGENDR is 1 (male) OR BPXSY1 is greater than 140.
dt <- ds %>%
  filter(RIAGENDR == 1 | BPXSY1 > 140)

###############################################################################
################################ Exercise 10: ################################# 
###############################################################################

# 1. Sort the dataset by BPXSY1 (systolic blood pressure) in ascending order.
dt <- ds %>%
  arrange(BPXSY1)

# 2. Sort the dataset by SMQ040 (smoking status) in descending order.
dt <- ds %>%
  arrange(desc(SMQ040))

# 3. Filter rows where BPXDI1 (diastolic blood pressure) is greater than 90 and
#    sort descending by BPXSY1.
dt <- ds %>%
  filter(BPXDI1 > 90) %>%
  arrange(desc(BPXSY1))

###############################################################################
################################ Exercise 11: ################################# 
###############################################################################

# 1. Rename BPXSY1 to systolicBP.
dt <- ds %>%
  rename(systolicBP = BPXSY1)

# 2. Rename SMQ040 to currentSmoker and BPXDI1 to diastolicBP.
dt <- ds %>%
  rename(
    currentSmoker = SMQ040,
    diastolicBP = BPXDI1
  )

# 3. Use rename_with() to replace BPX with pressure in all variables starting with BPX.
dt <- ds %>%
  rename_with(~ sub("^BPX", "pressure", .), starts_with("BPX"))

###############################################################################
################################ Exercise 12: ################################# 
###############################################################################

# 1. Create Pulse_Pressure variable
ds <- ds %>%
  mutate(pulse_pressure = BPXSY1 - BPXDI1)

# 2. Create Smoker_Status using if_else()
ds <- ds %>%
  mutate(smoker_status = if_else(SMQ040 == 3, 0, 1))

# 3. Categorize systolic blood pressure using case_when()
ds <- ds %>%
  mutate(bp_category = case_when(
    BPXSY1 < 120 ~ "normal",
    BPXSY1 >= 120 & BPXSY1 < 140 ~ "elevated",
    BPXSY1 >= 140 ~ "hypertension"
  ))

###############################################################################
################################ Exercise 13: ################################# 
###############################################################################

# 1. Convert SMQ040 (smoking status) from numeric to a factor with the following labels:
ds <- ds %>%
  mutate(smoker_status = factor(smoker_status,
                                levels = c(0, 1),
                                labels = c("no smoker", "current smoker")))

# 2. Convert the variable bp_category from string to factor variable. 
# Order the levels the following: "normal", "elevated", "high".
ds <- ds %>%
  mutate(bp_category = factor(bp_category,
                              levels = c("normal", "elevated", "hypertension")))

###############################################################################
################################ Exercise 14: ################################# 
###############################################################################

# baseR

# 1. Calculate basic descriptive statistics (minimum, mean, median, and maximum) for the following numeric variables: BPXSY1 (systolic blood pressure), BPXDI1 (diastolic blood pressure).

# BPXSY1 (Systolic blood pressure)
summary(ds$BPXSY1)
min(ds$BPXSY1, na.rm = TRUE)
mean(ds$BPXSY1, na.rm = TRUE)
median(ds$BPXSY1, na.rm = TRUE)
max(ds$BPXSY1, na.rm = TRUE)

# BPXDI1 (Diastolic blood pressure)
summary(ds$BPXDI1)
min(ds$BPXDI1, na.rm = TRUE)
mean(ds$BPXDI1, na.rm = TRUE)
median(ds$BPXDI1, na.rm = TRUE)
max(ds$BPXDI1, na.rm = TRUE)

# 2. Summarize frequencies and proportions for bp_category (blood pressure category) and smoker_status.

# Frequency and proportions for bp_category
table(ds$bp_category)
prop.table(table(ds$bp_category))

# Frequency and proportions for smoker_status
table(ds$smoker_status)
prop.table(table(ds$smoker_status))

# tidyverse

# 1. Calculate basic descriptive statistics (minimum, mean, median, and maximum) for the following numeric variables: BPXSY1 (systolic blood pressure), BPXDI1 (diastolic blood pressure).

## tidyverse

ds %>% # specifying for each variable on its own
  summarize(
    Min_Systolic = min(BPXSY1, na.rm = TRUE),
    Mean_Systolic = mean(BPXSY1, na.rm = TRUE),
    Median_Systolic = median(BPXSY1, na.rm = TRUE),
    Max_Systolic = max(BPXSY1, na.rm = TRUE),
    Min_Diastolic = min(BPXDI1, na.rm = TRUE),
    Mean_Diastolic = mean(BPXDI1, na.rm = TRUE),
    Median_Diastolic = median(BPXDI1, na.rm = TRUE),
    Max_Diastolic = max(BPXDI1, na.rm = TRUE)
  )


ds %>% # using summarize across
  summarize(
    across(
      c(BPXSY1, BPXDI1),
      list(
        Min = ~ min(.x, na.rm = TRUE),
        Mean = ~ mean(.x, na.rm = TRUE),
        Median = ~median(.x, na.rm = TRUE),
        Max =  ~max(.x, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}")
  )

# 2. Summarize frequencies and proportions for bp_category (blood pressure category) and smoker_status.

## tidyverse

# Frequency and proportions for bp_category
ds %>%
  count(bp_category) %>%
  mutate(Proportion = n / sum(n))

# Frequency and proportions for smoker_status
ds %>%
  count(smoker_status) %>%
  mutate(Proportion = n / sum(n))

## Sumarytools and table1:
# 1. Calculate basic descriptive statistics (minimum, mean, median, and maximum) for the following numeric variables: BPXSY1 (systolic blood pressure), BPXDI1 (diastolic blood pressure).

descr(ds$BPXSY1)
descr(ds$BPXDI1)

# 2. Summarize frequencies and proportions for bp_category (blood pressure category) and smoker_status.

freq(ds$bp_category)
freq(ds$smoker_status)

## Tasks 1 & 2 together

# using table1
table1(~ BPXSY1 + BPXDI1 + bp_category + smoker_status,    data = ds)

# using summarytools
dfSummary(ds)

###############################################################################
################################ Exercise 15: ################################# 
###############################################################################

# 1. Create a histogram for BPXSY1 (systolic blood pressure).
hist(ds$BPXSY1)

# 2. Create a boxplot for BPXSY1 (diastolic blood pressure) and stratify by smoker_status. Title the figure "Blood pressure and smoker status". Label the x-axis "Smoking status", the y-axis "Systolic blood pressure". Color the boxplots in blue and yellow.
boxplot(
  BPXSY1 ~ smoker_status,
  data = ds,
  main = "Blood pressure and smoker status",
  xlab = "Smoker status",
  ylab = "Systolic blood pressure",
  col = c("blue", "yellow")
)

# 3. Create a scatterplot showing the relationship between BPXSY1 (systolic blood pressure) and BPXDI1 (diastolic blood pressure).
plot(ds$BPXSY1, ds$BPXDI1)

# 4. Create a bar chart for bp_category (blood pressure category).
barplot(table(ds$bp_category))

###############################################################################
################################ Exercise 16: ################################# 
###############################################################################

# 1. Use tidyverse to filter for participants without missings for BPXSY1, group the dataset by bp_category calculate the mean and median for BPXSY1 (systolic blood pressure)
ds %>%
  filter(!is.na(BPXSY1)) %>%
  group_by(bp_category) %>%
  summarize(
    mean_Systolic = mean(BPXSY1, na.rm = TRUE),
    median_Systolic = median(BPXSY1, na.rm = TRUE),
    count = n()
  )

# 2. Using table1, create a summary table for pulse_pressure stratified by RIAGENDR
table1(~ pulse_pressure | RIAGENDR,
       data = ds)

###############################################################################
################################ Exercise 17: ################################# 
###############################################################################

# Cross-tabulation with ctable of bp_category and smoker_status
ctable(ds$bp_category, ds$smoker_status, prop = "c", useNA = "no", chisq = TRUE)








