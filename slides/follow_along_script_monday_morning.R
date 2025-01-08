# This script will help you to actively follow the slides during the monday morning program

### Using R as a simple calculator ###
a = 1 
b = 2
c = a + b

c

# can use = or "<-"

c <- a + b 

c

### Introduction to vectors ###

c(1,2,3)

c(a, b)

a_vector = c(1.23, 2.34, 6.21, 3.11, 3.412, 4.32, 5.922, 5.65)

a_vector[4]

### Introduction to array/vector ###

matrix(data = c(1,2,3,4,5,6,7,8), nrow = 4 )

a_matrix = matrix(data = c(1,2,3,4,5,6,7,8), nrow = 4 )

a_matrix[3,2] # first row, then column

### Introduction to using a function ###

sum(1, 2)

?sum()

### Exercise 1: 

a_vector = c(1.23, 2.34, 6.21, 3.11, 3.412, 4.32, 5.922, 5.65)

# calculate the mean of a_vector 


# calculate the standard deviation of a_vector


# calculate the maximal value of a_vector


# calculate the minimal value of a_vector


# calculate the Length of the vector

### Exercise 2: 

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

### Introduction to dataframes ###

# Create a data frame
df <- data.frame(x = 1:3, y = c("a", "b", "c"))

# Printing
print(df)

# Create a tibble
library(tibble)
tb <- tibble(x = 1:3, y = c("a", "b", "c"))

print(tb)

### Introduction to packages ###

install.packages("tidyverse")
library(tidyverse)

